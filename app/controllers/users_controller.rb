class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :forbid_login_user, only:[:new, :create]
  before_action :not_login_user, only:[:index, :show, :following, :followers]

  def index
    @users = User.all.order(created_at: :DESC)
  end

  def search
    @users = User.search_keyword(params[:name], params[:year])
    render 'index'
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @microposts = @user.microposts.order(created_at: :DESC)
    @liked_posts = @user.liked_posts.order(created_at: :DESC)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    # @user.name = params[:name]
    # @user.email = params[:email]
    # @user.password = params[:password]
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:success] = "アカウント情報を更新しました"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:success] = "アカウントを削除しました"
      redirect_to("/users")
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    @title = "フォロー中"
    @heading = "がフォローしているユーザー"
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @title = "フォロワー"
    @heading = "のフォロワー"
    render 'show_follow'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :year, :major, :user_image, :password,:password_confirmation)
    end

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:danger] = "権限がありません"
        redirect_to about_path
      end
    end

end
