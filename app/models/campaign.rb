class Campaign < ActiveRecord::Base
	belongs_to :language
	belongs_to :user
	has_many :translations

	before_validation :init_campaign

	validates_presence_of :source_text, :language_id, :status, :user
	validates :status, inclusion: { in: %w(pending available posted), message: "%{value} is not a valid status" }

	private

	def init_campaign
		self.status = "pending"
	end
end
