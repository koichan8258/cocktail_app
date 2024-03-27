class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @recipes = @user.recipes
  end
end