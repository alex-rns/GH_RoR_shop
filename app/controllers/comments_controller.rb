class CommentsController < ApplicationController
  def new
    @comment = Comment.new(user: current_user, product_id: params[:product_id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product)
    else
      flash.now[:error] = @comment.errors.messages
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :product_id, :body, :rating)
  end

end
