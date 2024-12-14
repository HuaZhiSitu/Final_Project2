class SkinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    matching_skins = Skin.all
    @list_of_skins = matching_skins.order(created_at: :desc)

    # matching_bids = Bids.all
    # @list_of_bids = matching_bids.order(created_at: :desc)

    render template: "skins/index"
  end

  def show
    the_id = params.fetch("skin_id")
    matching_skins=Skin.where({:id=>the_id})
    @the_skin = matching_skins.at(0)
    # matching_skins = Skin.find(params[:id])
    # @the_skin = matching_skins

    @matching_bids=Bid.where({:id=>the_id})

    # the_id = params.fetch("id")
    # matching_skins = Skin.where({:id=>the_id})
    # @the_skins = matching_skins.at(0)
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
