class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all#indexアクションに、インスタンス変数@prototypesを定義し、すべてのプロトタイプの情報を代入した
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @user = current_user #【間違い修正】元々記載なし
    if @prototype.save
      # redirect_to prototypes_path(@user) #【間違い修正】redirect_to root_path
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @prototype = Prototype.find(params[:id])
    @prototype = Prototype.find(params[:id])
  end

  def edit
  
  end

  def update
  
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)

    # binding.pry
  end
end
