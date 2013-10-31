class Translation < ActiveRecord::Base
  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
  validates :status, inclusion: { in: %w(pending reviewable available), message: "%{value} is not a valid status" }
end
