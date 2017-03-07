class CommentsController < ApplicationController
  before_action :find_post_id, only: [:create, :destroy]

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_post_id
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit([:name, :body])
  end
end
