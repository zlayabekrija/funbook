class ReactionsController < ApplicationController
  # before_action :find_post
  def new
  end

  def create
    Reaction.create(params_reactions)
    redirect_to timeline_path
  end

  private

  def params_reactions
    params.require(:reaction).permit(:user_id, :like, :post_id)
  end
end
