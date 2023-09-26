class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    binding.pry
    # @user = curret_user
    if @comment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # prototypesコントローラーのshowアクションに、
    #@commentというインスタンス変数を定義し、Commentモデルの新規オブジェクトを代入した
    @comment = Comment.new 
    @prototype = Prototype.new
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
