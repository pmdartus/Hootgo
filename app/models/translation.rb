class Translation < ActiveRecord::Base

  include GengoHelper

  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }

  before_validation :init_translation
  after_create :send_job_to_gengo

  private

  ## init_translation
  # Setup the translation
  def init_translation
    self.status = "pending"
  end

  ## send_job_to_gengo 
  # Setup and send the translation job to the gengo API
  def send_job_to_gengo
    # Send the Job to gengo API
    ret = gengo_api.postTranslationJobs({
      jobs: {
        job_1: {
          :type => "text",
          :slug => "Tweet translation",
          :body_src => campaign.source_text,
          :lc_src => campaign.language.code,
          :lc_tgt => self.language.code,
          :tier => "standard"
        }
      }
    })

    # Update Campaign credits
    translation_credit = ret['response']['credits_used'].sub(".", "").to_i
    new_campaign_price = campaign.used_credits + translation_credit * 1.5
    campaign.update(used_credits: new_campaign_price.ceil.to_i)

    # Update the Job id returned by Gengo API
    self.update(job_id: ret['response']['order_id']) 
  end
end
