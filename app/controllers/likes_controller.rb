class LikesController < ApplicationController
  before_action :not_login_user

  def create
    @like = @current_user.likes.create(micropost_id: params[:micropost_id])
    @micropost = @current_user.liked_posts.find(params[:micropost_id])
    if @like.save
      respond_to do |format|
        format.html { redirect_to @micropost }
        format.js
    end
    end
  end

  def destroy
    @micropost = @current_user.liked_posts.find(params[:micropost_id])
    @current_user.likes.find_by(micropost_id: params[:micropost_id]).destroy
    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
  end
  end
end
