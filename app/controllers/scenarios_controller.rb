class ScenariosController < ApplicationController

  def index
    @scenarios = Scenario.all 
  end

  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = Scenario.new(scenario_params)
    if @scenario.save
      render :create
    else
      render :new
    end
  end

  private
   
  def scenario_params
    params.require(:scenario).permit(:title, :scenario, :image).merge(user_id: current_user.id)
  end

  
end
