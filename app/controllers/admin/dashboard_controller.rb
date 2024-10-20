class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  def index
    @users_count = User.count
    @services_count = Service.count
    @bookings_count = Booking.count
    # Add more metrics or stats if needed
  end

  private

  def ensure_admin
    unless current_user.admin?
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_path
    end
  end
end
