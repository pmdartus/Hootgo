class Language < ActiveRecord::Base
	
	include GengoHelper

	validates :name, uniqueness: true, presence: true
	validate :existing_language


	private

	def existing_language
		gengo_language = gengo_api.getServiceLanguages()['response']
		if !( gengo_language.any? {|lan| lan['language'] == name} )
			errors.add(:name, "Not present Gengo translation for the selected language")
		end
	end

end
