class MicropostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :not_login_user
  
  def index
    @microposts = Micropost.all.order(updated_at: :DESC)
  end

  def search
    @microposts = Micropost.search_year(params[:year])
    render 'index'
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = @current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to microposts_path
    else
      render 'microposts/new'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "投稿を編集しました"
      redirect_to microposts_path
    else
      render 'microposts/edit'
    end
  end

  def show
    @micropost = Micropost.find_by(id:params[:id])
    @comments = @micropost.comments.order(created_at: :DESC)
    @comment = @micropost.comments.build
  end


  def destroy
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.destroy
      flash[:success] = "投稿を削除しました"
      redirect_to microposts_path
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def ensure_correct_user
      @micropost = @current_user.microposts.find_by(id: params[:id])
      if @micropost.nil? 
        flash[:danger] = "権限がありません"
        redirect_to microposts_path
      end
    end
end
