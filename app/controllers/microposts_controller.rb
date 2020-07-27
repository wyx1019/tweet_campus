class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all.order(created_at: :DESC)
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

  def edit
    @micropost = Micropost.find_by(id:params[:id])
  end

  def update
    @micropost = Micropost.find_by(id:params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "編集しました"
      redirect_to "/microposts/#{@micropost.id}"
    else
      render 'microposts/edit'
    end
  end

  def show
    @micropost = Micropost.find_by(id:params[:id])
  end

  def destroy
    @micropost = Micropost.find_by(id:params[:id])
    if @micropost.destroy
      flash[:success] = "投稿を削除しました"
      redirect_to "/microposts"
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
