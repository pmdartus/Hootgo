class Translation < ActiveRecord::Base

  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }

  before_validation :init_translation

  def format_to_gengo(source_text, source_lang)
    job = {
      :type => "text",
      :slug => "Twitter",
      :body_src => source_text,
      :lc_src => source_lang,
      :lc_tgt => self.language.code,
      :tier => "standard"
    }
  end

  private

  ## init_translation
  # Setup the translation
  def init_translation
    self.status = "pending"
  end
end
