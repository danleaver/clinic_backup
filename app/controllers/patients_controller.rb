class PatientsController < ApplicationController
  before_action :set_patient, only: [
    :show, :edit, :update, :destroy] 
  def index
    @patients = Patient.all
  end
  def show
    @appointments = @patient.appointments.all
  end
  def new
    @patient = Patient.new
    :@physician
  end
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to physicians_path
    else
      render :new
    end
  end
  def edit
    render partial: "form"
  end
  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end
  def destroy
    @patient.destroy
    redirect_to root_path
  end
  private
    def patient_params
      params.require(:patient).permit(:name)
    end
    def set_patient
      @patient = Patient.find(params[:id])
    end
end
