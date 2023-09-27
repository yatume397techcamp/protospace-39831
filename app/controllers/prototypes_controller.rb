class PrototypesController < ApplicationController
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
    # binding.pry
    @prototype = Prototype.find(params[:id])
    # @comments = @prototype.comments
    @comment = Comment.new
    # binding.pry

    # prototypesコントローラーのshowアクションに、@commentというインスタンス変数を定義し、Commentモデルの新規オブジェクトを代入
    # @comment = Comment.new(comment_params)
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


end
