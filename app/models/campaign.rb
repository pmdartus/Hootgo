class Campaign < ActiveRecord::Base

  	include GengoHelper

	belongs_to :user
	belongs_to :language
	has_many :translations, dependent: :destroy
	has_many :posts, dependent: :destroy

	accepts_nested_attributes_for :posts

	validates :source_text, :language_id, :user, presence: true
	validate :debit_user

	def set_translations(languages)
		languages.each do |lang|
			if lang != ""
				trans = self.translations.new
    			trans.status = "pending"
				trans.language = Language.find(lang)
				trans.save
			end
		end
	end

	def get_quote
		quote = 0
		gengo_jobs = {:jobs => {}}

		self.translations.each_with_index{ |trans, index|
			job = trans.format_to_gengo(self)
			job_key = "job_#{index + 1}"
			gengo_jobs[:jobs][job_key] = job
		}

		ret = gengo_api.getTranslationQuote(gengo_jobs)
		ret["response"]["jobs"].each_value{ |trans|
			quote += trans["credits"]
		}

		self.used_credits = quote * 100 * 1.5
	end

	## send_job_to_gengo
	# Setup and send the translation job to the gengo API
	def send_job_to_gengo
	  gengo_jobs = { jobs:{} }

	  self.translations.each_with_index{ |trans, index|
		job = trans.format_to_gengo(self)
		job_key = "job_#{index + 1}"
		gengo_jobs[:jobs][job_key] = job
	  }

	  ret = gengo_api.postTranslationJobs(gengo_jobs)

	  # Update Campaign credits
	  translation_credit = ret['response']['credits_used'].sub(".", "").to_i * 1.5
	  self.used_credits = translation_credit.ceil
	end

	def get_status
		status = "Launched"
		self.translations.each { |trans|
			if trans.status != "available"
				status = "Open"
			end
		}

		return status
	end

	private

	def debit_user
		if self.user.credits - self.used_credits < 0
			errors.add(:used_credits, "Not enough credits for this campaign")
		else
			self.user.credits -= used_credits
			self.user.save
		end
	end
end
