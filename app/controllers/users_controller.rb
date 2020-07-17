class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      # image_name: "default_user.jpg",
    )
    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def my_page
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    # @user.password = params[:password]
    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end 
end
