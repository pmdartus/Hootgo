class Translation < ActiveRecord::Base
  belongs_to :language
  belongs_to :campaign

  before_validation :init_translation

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }

  def init_translation
  	self.status = "pending"
  end
end
