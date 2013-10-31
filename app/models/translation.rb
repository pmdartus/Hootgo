class Translation < ActiveRecord::Base

  include GengoHelper

  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }

  before_validation :init_translation
  after_create :send_job_to_gengo

  private

  def init_translation
    self.status = "pending"
  end

  def send_job_to_gengo
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

  end
end
