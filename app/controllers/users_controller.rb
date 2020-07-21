class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}

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
      redirect_to("/about")
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
