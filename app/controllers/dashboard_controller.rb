class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @users = User.find(params[:id])
  end
end
  