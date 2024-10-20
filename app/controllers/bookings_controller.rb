class BookingsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    def index
      @services = Service.all
      @bookings = current_user.bookings.includes(:service)
      @past_bookings = current_user.bookings.where('booking_time < ?', Time.now).includes(:service)
      @upcoming_bookings = current_user.bookings.where('booking_time >= ?', Time.now).includes(:service)
    end
  
    def create
        @service = Service.find(params[:service_id])
        booking_time = params[:booking_time]
      
        if @service.available_at?(booking_time)
          @booking = current_user.bookings.build(service: @service, booking_time: booking_time)
      
          if @booking.save
            flash[:notice] = "Booking successful!"
            redirect_to bookings_path
          else
            flash[:alert] = "Failed to create booking. Please try again."
            redirect_to service_path(@service)
          end
        else
          flash[:alert] = "This time slot is not available."
          redirect_to service_path(@service)
        end
      end
      
      
  end
  