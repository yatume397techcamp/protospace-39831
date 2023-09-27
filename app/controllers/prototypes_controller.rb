#prototypes_controller.rb
class PrototypesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :set_prototype, only: [:edit, :update, :destroy]
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!,only:[:edit, :new]

  def index #indexアクションを設定
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @user = current_user
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

  # def ensure_correct_user
  #   redirect_to root_path unless @prototype.user_id == current_user.id
  # end

end
