class CommentsController < ApplicationController
    before_action :ensure_correct_user, only: [:destroy]
    before_action :not_login_user

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def create
        @comment = @current_user.comments.create(comment_params)
        @comment.micropost_id = params[:micropost_id]
        @micropost = Micropost.find_by(id: params[:micropost_id])
        if @comment.save
            flash[:success] = "コメントを投稿しました"
            redirect_back(fallback_location: root_path)
            # redirect_to micropost_comment_path(@comment)
            # redirect_to micropost_path(@micropost)
        else
            flash[:danger] = "コメントを失敗しました"
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
