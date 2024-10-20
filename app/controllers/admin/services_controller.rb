class Admin::ServicesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin
    before_action :set_service, only: [:show, :edit, :update, :destroy]
  
    def index
      @services = Service.all
    end
  
    def new
      @service = Service.new
    end
  
    def create
      @service = Service.new(service_params)
  
      if @service.save
        flash[:notice] = "Service created successfully!"
        redirect_to admin_services_path
      else
        flash[:alert] = "Failed to create service."
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @service.update(service_params)
        flash[:notice] = "Service updated successfully!"
        redirect_to admin_services_path
      else
        flash[:alert] = "Failed to update service."
        render :edit
      end
    end
  
    def destroy
      @service.destroy
      flash[:notice] = "Service deleted successfully!"
      redirect_to admin_services_path
    end
  
    private
  
    def set_service
      @service = Service.find(params[:id])
    end
  
    def service_params
      params.require(:service).permit(:name, :description, :duration, :price)
    end
  
    def ensure_admin
      unless current_user.admin?
        flash[:alert] = 'You are not authorized to perform this action.'
        redirect_to root_path
      end
    end
  end
  