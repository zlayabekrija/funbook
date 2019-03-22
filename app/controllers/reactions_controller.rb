class ReactionsController < ApplicationController
  before_action :check_if_liked, only: [:create]
  before_action :check_if_disliked, only: [:create]
  def new
  end

  def create
    Reaction.create(params_reactions)
    stay_on_same_path
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
      stay_on_same_path
    elsif like.present?
      like.destroy
      stay_on_same_path
    end
  end

  def check_if_disliked
    dislike = Reaction.find_by(user_id: params[:reaction][:user_id], resource_id: params[:reaction][:resource_id] ,
                            resource_type: params[:reaction][:resource_type], dislike: true)


    if params[:reaction][:like] && dislike.present?
      dislike.update_attributes(dislike: nil,like: true)
      stay_on_same_path
    elsif dislike.present?
        dislike.destroy
        stay_on_same_path
    end
  end

  def stay_on_same_path
    prev = Rails.application.routes.recognize_path(request.referrer)
    if prev[:controller] == "posts"
        redirect_to timeline_path
    else
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end


end
