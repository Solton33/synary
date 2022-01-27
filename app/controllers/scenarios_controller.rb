class ScenariosController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_scenario, only: [:show, :edit]
  before_action :set_scenario2, only: [:update, :destroy]

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

  def show
    @user = @scenario.user_id
  end

  def edit
    if current_user.id != @scenario.user_id
      redirect_to root_path
    end 
  end

  def update
      if scenario.update(scenario_params)
        redirect_to scenario_path(scenario.id)
      else
        render :edit
      end
  end

  def destroy
    if current_user == scenario.user_id
      scenario.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
   
  def scenario_params
    params.require(:scenario).permit(:title, :scenario, :image, :nickname).merge(user_id: current_user.id)
  end

  def set_scenario
    @scenario = Scenario.find(params[:id])
  end
    
  def set_scenario2
    scenario = Scenario.find(params[:id])
  end

  
end
