include GengoHelper

#----------------------------
# Add all suported languages
#----------------------------
supported_languages = gengo_api.getServiceLanguages()['response']
supported_languages.each do |lang|
	puts "Add language: #{lang['language']}"
	Language.create(name: lang['language'], code: lang['lc'])
end

