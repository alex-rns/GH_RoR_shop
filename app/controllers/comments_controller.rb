class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new(user: current_user, product_id: params[:product_id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product)
    else
      flash.now[:error] = @comment.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to @comment.product
  end

  def destroy
    @comment.destroy
    redirect_to @comment.product
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :product_id, :body, :rating)
  end
end
