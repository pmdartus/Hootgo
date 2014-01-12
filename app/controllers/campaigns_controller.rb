class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = current_user.campaigns
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new
    @campaign.language = Language.find(campaign_params['language'])
    @campaign.source_text = campaign_params['source_text']
    @campaign.user = current_user

    @campaign.set_translations(campaign_params['translations'])
    @campaign.get_quote

    respond_to do |format|
      if @campaign.save
        @campaign.send_job_to_gengo

        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_path, notice: 'Campaign was successfully deleted.' }
      format.json { render status: :deleted, location: campaigns_path }
    end
  end

  private

  ## set_compaign
  # Find and return the campaign passed in parameter
  # if the current_user is not the owner of the camapaign it return a 404
  def set_campaign
    @campaign = Campaign.find(params[:id])
    @campaign.user_id != current_user.id ? not_found : @campaign
  end

  ## camapign_params
  # Define all the aceptable parameters for a post request
  def campaign_params
    puts params
    params.require(:campaign).permit(:source_text, :language, :translations => [])
  end
end