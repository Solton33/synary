class ScenariosController < ApplicationController

  def index
    @scenarios = Scenario.all 
  end

  def new
    @scenario = Scenario.new
  end

  def create
    Scenario.create(scenario_params)
  end

  private
   
  def scenario_params
    params.require(:scenario).permit(:title, :image, :scenario).merge(user_id: current_user.id)
  end

  
end
