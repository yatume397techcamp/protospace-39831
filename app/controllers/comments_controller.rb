class CommentsController < ApplicationController

  def create
    # Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype #@prototypeに@comment.prototypeを格納
      render 'prototypes/show' #上記の@prototypeのページを表示
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
