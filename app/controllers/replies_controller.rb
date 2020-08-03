class RepliesController < ApplicationController
    def create
        @reply = @current_user.replies.create(reply_params)
        @reply.comment_id = params[:comment_id]
        @comment = Comment.find(params[:comment_id])
        if @reply.save
            flash[:success] = "コメントを投稿しました"
        else
            flash[:danger] = "コメントを失敗しました"
        end
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @reply = Reply.find_by(comment_id: params[:comment_id])
        if @reply.destroy
            flash[:success] = "返信を削除しました"
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def reply_params
      params.require(:reply).permit(:content)
    end

    def ensure_correct_user
        @reply = @current_user.replys.find(params[:reply_id])
        if @reply.nil? 
          flash[:danger] = "権限がありません"
          redirect_back(fallback_location: root_path)
        end
    end
end
