class RelationshipsController < ApplicationController
    before_action :not_login_user
    def create
        @user = User.find(params[:followed_id])
        @current_user.follow(@user)
        redirect_back(fallback_location: root_path)
        # respond_to do |format|
        #     format.html { redirect_to @user }
        #     format.js
        #   end
    end

    def destroy
        @user = Relationship.find(params[:id]).followed
        @current_user.unfollow(@user)
        redirect_back(fallback_location: root_path)
        # respond_to do |format|
        #     format.html { redirect_to @user }
        #     format.js
        #   end
    end
end
