class Campaign < ActiveRecord::Base
	belongs_to :language

	validates_presence_of :source_text, :language, :status
	validates :status, inclusion: { in: %w(pending available posted), message: "%{value} is not a valid status" }
end
