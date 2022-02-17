class ScenariosController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show, :search]

  def index
    @scenarios = Scenario.all.order(created_at: :desc)
    @tags = Scenario.tag_counts_on(:tags).most_used(3)
     if params[:tag_name]
      @scenarios = Scenario.tagged_with("#{params[:tag_name]}")
     end   
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
    @scenario = Scenario.find(params[:id])
    @comment = Comment.new
    @comments = @scenario.comments.includes(:user)
    @tag = @scenario.tag_counts_on(:tags)
  end

  def edit
    @scenario = Scenario.find(params[:id])
    if current_user.id != @scenario.user_id
      redirect_to root_path
    end 
  end

  def update
    scenario = Scenario.find(params[:id])
      if scenario.update(scenario_params)
        redirect_to scenario_path(scenario.id)
      else
        render :edit
      end
  end

  def destroy
    scenario = Scenario.find(params[:id])
    if current_user.id == scenario.user_id
      scenario.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @scenarios = Scenario.search(params[:keyword])
  end


  private
   
  def scenario_params
    params.require(:scenario).permit(:title, :scenario, :image, :nickname, :tag_list).merge(user_id: current_user.id)
  end

  def set_scenario
    
  end
  
end
