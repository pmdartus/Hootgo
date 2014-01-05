class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  def update_status

  end

  private

  ## set_compaign
  # Find and return the campaign passed in parameter
  # if the current_user is not the owner of the camapaign it return a 404
  def set_translation
    @translation = Translation.find(params[:translation_id])
  end

  ## camapign_params
  # Define all the aceptable parameters for a post request
  def translation_params
    params.require(:job).permit(:job, :language, :translations => [])
  end
end