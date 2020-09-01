class ParticipationsController < ApplicationController
    before_action :not_login_user

    def create
        @participation = @current_user.participations.create(content_id: params[:content_id])
        @content = @current_user.participated_contents.find(params[:content_id])
        if @participation.save
            respond_to do |format|
              format.html { redirect_to @content }
              format.js
            end
        end
    end

    def destroy
        @content = @current_user.participated_contents.find(params[:content_id])
        @current_user.participations.find_by(content_id: params[:content_id]).destroy
        respond_to do |format|
            format.html { redirect_to @content }
            format.js
          end
    end

end
