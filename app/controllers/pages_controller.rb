class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout "layouts/settings"

  def index
    @pages = current_user.pages
  end

  def edit
  end

  def update
    puts page_params
    if @page.update(page_params)
      redirect_to pages_path, notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def set_page
    @page = Page.find(params[:id])
    @page.authorization.user_id != current_user.id ? not_found : @page
  end

  def page_params
    params.require(:page).permit(:name, :language_id)
  end
end
