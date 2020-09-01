class ContentsController < ApplicationController
    before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_content, only: [:destroy, :edit, :update]

    def index
        @contents01 = Content.where(category: "色別対抗").order(created_at: :ASC)
        @contents02 = Content.where(category: "クラス対抗").order(created_at: :ASC)
        @contents03 = Content.where(category: "自由参加").order(created_at: :ASC)
        @contents04 = Content.where(category: "アトラクション").order(created_at: :ASC)
        @contents05 = Content.where(category: "エキシビション").order(created_at: :ASC)
    end

    def new
        @content = Content.new
    end

    def create
        if @content = Content.create!(content_params)
          flash[:success] = "競技を追加しました"
          redirect_to contents_path
        else
          render 'new'
        end
      end
    
    def destroy
        @content.destroy!
    end
    
    def edit
    end
    
    def update
        if @content.update!(content_params)
          flash[:success] = "競技内容を更新しました"
          redirect_to contents_path
        else
          render 'edit'
        end
    end

    private
      def content_params
        params.require(:content).permit(:name, :year, :category, :catch, :collaboration, :intensity, :detail)
      end
      
      def set_content
        @content = Content.find(params[:id])
      end
end
