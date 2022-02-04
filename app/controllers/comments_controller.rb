class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to scenario_path(comment.scenario.id)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id, scenario_id: params[:scenario_id])
    end
end
