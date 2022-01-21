class ScenariosController < ApplicationController

  def index
    @scenarios = Scenario.all 
  end

  def new
    @scenario = Scenario.new
  end

  def create
  end


  
end
