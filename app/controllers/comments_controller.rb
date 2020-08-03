class CommentsController < ApplicationController
    before_action :ensure_correct_user, only: [:destroy]
    before_action :not_login_user

    def show
        @comment = Comment.find(params[:comment_id])
        @replies = @comment.replies.order(created_at: :DESC)
        @reply = @comment.replies.build
        @micropost = @comment.micropost
    end

    def create
        @comment = @current_user.comments.create(comment_params)
        @comment.micropost_id = params[:micropost_id]
        @micropost = Micropost.find(params[:micropost_id])
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

    def destroy
        @comment = Comment.find(params[:comment_id])
        micropost = Micropost.find(@comment.micropost.id)
        if @comment.destroy
          flash[:success] = "コメントを削除しました"
          redirect_to micropost_path(micropost)
        end
      end

    private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def ensure_correct_user
        @comment = @current_user.comments.find(params[:comment_id])
        if @comment.nil? 
          flash[:danger] = "権限がありません"
          redirect_back(fallback_location: root_path)
        end
    end
end
