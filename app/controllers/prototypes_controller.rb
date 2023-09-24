class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @user = current_user

    if @prototype.save
      redirect_to prototypes_path(@user)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)

    # binding.pry
  end
end
