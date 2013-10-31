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
    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
    @campaign.user_id != current_user.id ? not_found : @campaign
  end

  def campaign_params
    params.require(:campaign).permit(:source_text, :language)
  end
end