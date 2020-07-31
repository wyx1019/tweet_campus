class CommentsController < ApplicationController
    before_action :ensure_correct_user, only: [:edit, :update, :destroy]
    before_action :not_login_user

    def show
        @comment = Comment.find(params[:id])
    end
end
