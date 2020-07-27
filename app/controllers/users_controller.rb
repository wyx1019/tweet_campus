class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :forbid_login_user, only:[:new, :create]
  before_action :not_login_user,only:[:index, :show, :edit, :update]

  def index
    @users = User.all.order(created_at: :DESC)
  end

  def search
    @users = User.search(params[:name])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
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
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:danger] = "権限がありません"
      redirect_to about_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :year, :major, :password,:password_confirmation)
    end

end
