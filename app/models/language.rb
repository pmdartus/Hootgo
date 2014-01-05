class Language < ActiveRecord::Base

	include GengoHelper

	validates :name, uniqueness: true, presence: true
	validates :code, uniqueness: true, presence: true

	## existing_language
	# Check if the created language if manage by gengo
	# Not a validation because it tacks to long for testing
	def existing_language
		gengo_language = gengo_api.getServiceLanguages()['response']
		if !( gengo_language.any? {|lan| lan['language'] == name} )
			return false
		end

		return true
	end

	private
end
