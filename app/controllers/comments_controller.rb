class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :spot_id)
  end 
end
