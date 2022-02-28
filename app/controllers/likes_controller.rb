class LikesController < ApplicationController
  before_action :like_params
  
  def create
   @like = Like.create(user_id: current_user.id, scenario_id: @scenario.id)
  end

  def destroy
   Like.find_by(user_id: current_user.id, scenario_id: @scenario.id).destroy
  end

  private

  def like_params
    @scenario = Scenario.find(params[:id])
  end

end
