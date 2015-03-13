class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find_by_username(params[:username])

    if @user.nil?
      redirect_to root_url
    end

  end

end
