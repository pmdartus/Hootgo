class Campaign < ActiveRecord::Base

  	include GengoHelper

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

	## send_job_to_gengo
	# Setup and send the translation job to the gengo API
	def send_job_to_gengo
	  # Send the Job to gengo API
	  gengo_jobs = {:jobs => {}}
	  self.translations.each_with_index{ |trans, index|
		job = trans.format_to_gengo(self.source_text, self.language.code)
		job_key = "job_#{index + 1}"
		gengo_jobs[:jobs][job_key] = job
	  }

	  ret = gengo_api.postTranslationJobs(gengo_jobs)

	  # Update Campaign credits
	  translation_credit = ret['response']['credits_used'].sub(".", "").to_i * 1.5
	  self.used_credits = translation_credit.ceil
	end

	private

	def init_campaign
		self.status = "pending"
	end
end
