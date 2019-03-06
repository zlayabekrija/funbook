class ReactionsController < ApplicationController
  before_action :check_if_liked, only: [:create]
  before_action :check_if_disliked, only: [:create]
  # before_action :toggle_like_to_dislike, only: [:create]
  # before_action :toggle_dislike_to_like, only: [:create]
  def new
  end

  def create
    Reaction.create(params_reactions)
    redirect_to timeline_path
  end

  private

  def params_reactions
    params.require(:reaction).permit(:user_id, :like, :dislike, :resource_id, :resource_type)
  end

  def check_if_liked
    like = Reaction.find_by(user_id: params[:reaction][:user_id], resource_id: params[:reaction][:resource_id] ,
                         resource_type: params[:reaction][:resource_type], like: true)

    if params[:reaction][:dislike] && like.present?
      like.update_attributes(like: nil,dislike: true)
      redirect_to timeline_path
    elsif like.present?
      like.destroy
      redirect_to timeline_path
    end
  end

  def check_if_disliked
    dislike = Reaction.find_by(user_id: params[:reaction][:user_id], resource_id: params[:reaction][:resource_id] ,
                            resource_type: params[:reaction][:resource_type], dislike: true)


    if params[:reaction][:like] && dislike.present?
      dislike.update_attributes(dislike: nil,like: true)
      redirect_to timeline_path
    elsif dislike.present?
        dislike.destroy
        redirect_to timeline_path
    end
  end


end
