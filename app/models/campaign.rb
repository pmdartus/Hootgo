class Campaign < ActiveRecord::Base
	belongs_to :language
	belongs_to :user
	has_many :translations, dependent: :destroy

	validates :source_text, :language_id, :status, :user, presence: true
	validates :status, inclusion: { in: %w(pending available posted), message: "%{value} is not a valid status" }

	before_validation :init_campaign

	def set_translations(languages)
		languages.each do |lang|
			if lang != ""
				trans = self.translations.new
				trans.language = Language.find(lang)
				trans.save
			end
		end
	end

	private

	def init_campaign
		self.status = "pending"
		self.used_credits = 0
	end
end
