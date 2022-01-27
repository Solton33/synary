class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @scenarios = @user.scenarios
  end

end
