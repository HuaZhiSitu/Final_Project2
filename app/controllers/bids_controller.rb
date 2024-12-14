class BidsController < ApplicationController
  before_action :authenticate_user!

  def user
    

  def create
    @skin = Skin.find(params[:skin_id])
    @bid = @skin.bids.build(bid_params.merge(user: current_user))
    if @bid.save
      redirect_to @skin, notice: "Bid successfully placed!"
    else
      redirect_to @skin, alert: "Failed to place bid. Make sure the amount is valid."
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end
end
