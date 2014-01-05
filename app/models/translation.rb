class Translation < ActiveRecord::Base

  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }

  before_validation :init_translation

  def format_to_gengo(camp)
    job = {
      :type => "text",
      :slug => "Twitter",
      :body_src => camp.source_text,
      :lc_src => camp.language.code,
      :lc_tgt => self.language.code,
      :tier => "standard",
      :callback_url => "http://hootgo.herokuapp.com/campaigns/#{camp.id}/translations/#{self.id}/update_status",
      :auto_approve => 1
    }
  end

  private

  ## init_translation
  # Setup the translation
  def init_translation
    self.status = "pending"
  end
end
