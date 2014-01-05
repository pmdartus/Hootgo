class TranslationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update_status]
  before_action :set_translation, only: [:update_status]

  def update_status
    puts params[:job]
  end

  private

  ## set_compaign
  # Find and return the campaign passed in parameter
  # if the current_user is not the owner of the camapaign it return a 404
  def set_translation
    @translation = Translation.find(params[:translation_id])
  end
end