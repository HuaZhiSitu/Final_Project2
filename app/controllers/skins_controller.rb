class SkinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    matching_skins = Skin.all
    @list_of_skins = matching_skins.order(created_at: :desc)

    render template: "skins/index"
  end

  def show
    matching_skins = Skin.find(params[:id])
    @the_skin = matching_skins
    render template: "skins/show"
  end

  def new
    @skin = Skin.new
  end

  def create
    @skin = current_user.skins.build(skin_params)
    if @skin.save
      redirect_to @skin, notice: "Skin successfully uploaded!"
    else
      render :new
    end
  end

  private

  def skin_params
    params.require(:skin).permit(:name, :description, :starting_price, :image)
  end
end
