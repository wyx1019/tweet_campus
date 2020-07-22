class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all 
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = @current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to "/microposts"
    else
      render 'microposts/new'
    end
  end

  def destroy
    
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
