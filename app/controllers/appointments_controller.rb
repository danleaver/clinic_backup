class AppointmentsController < ApplicationController
  before_action :set_physician, except: [:index, :show]
  # before_action :set_patient
  def index
    
   end

  def new
    # @test = 0
    
     @appointment = @physician.appointments.new
     @patients = Patient.all
  end

  def create

    # if @test == 0
        @patients = Patient.all
        @appointment = @physician.appointments.new(appointment_params)
        if @appointment.save
          redirect_to physician_path(@physician)
        else
          flash[:notice] = "Error, date must be after Today"
          render :new
        end
    end

  def edit
    @appointment = @physician.appointments.find(params[:id])
    @patients = Patient.all
  end

  def update
    @patients = Patient.all

    @appointment = @physician.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to root_path
    else
      render :edit
      flash[:notice] = "Error, date must be after Today"
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @patients = Patient.all
    @physicians = Physician.all
  end


  def destroy
    @appointment = @physician.appointments.find(params[:id])
    @appointment.destroy
    redirect_to physician_path(@physician)
  end

  private
  def appointment_params
    params.require(:appointment).permit( :appointment_date, 
    :physician_id,
    :patient_id)
  end

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end

  # def set_patient
  #   @patient = Patient.find(params[:patient_id])
  # end

end
