module GengoHelper

  def gengo_api
    @gengo ||= Gengo::API.new({
      :public_key => 'o0qojvxVu0QUFE1@|=l3xXW0V9cFiTfBGRI7f[@}^=fC0CRo0b=nZyfO9|c5mDGl',
      :private_key => '{_Kj_-yL^Z[vzm=5YfO0Nv2@sqyIRF276gcaaWIEg=sooYnHqZ^o04qpU{pO00p_',
      :sandbox => true, # Or false, depending on your work
    })
  end

end