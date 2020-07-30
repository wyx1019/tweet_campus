class LikesController < ApplicationController
  before_action :not_login_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @like = @micropost.like(@current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @like = @micropost.unlike(@current_user)
    redirect_back(fallback_location: root_path)
  end
end
