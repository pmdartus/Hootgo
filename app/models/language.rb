class Language < ActiveRecord::Base
	validates :name, uniqueness: true
	validate :existing_language

	private

	#
	def existing_language
		gengo = Gengo::API.new({
		    :public_key => 'o0qojvxVu0QUFE1@|=l3xXW0V9cFiTfBGRI7f[@}^=fC0CRo0b=nZyfO9|c5mDGl',
		    :private_key => '{_Kj_-yL^Z[vzm=5YfO0Nv2@sqyIRF276gcaaWIEg=sooYnHqZ^o04qpU{pO00p_',
		    :sandbox => true,
		})

		gengo_language = gengo.getServiceLanguages()['response']
		if !( gengo_language.any? {|lan| lan['language'] == name} )
			errors.add(:name, "Not present Gengo translation for the selected language")
		end
	end
end
