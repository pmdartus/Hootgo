class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_capaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
  end


  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @camapign.state = pending
    respond_to do |format|
      if @article.save
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
  end

  def article_params
    params.require(:campaign).permit(:source_text, :language)
  end
end