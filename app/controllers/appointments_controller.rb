class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_patient
  before_action :set_appointment, only: [:show, :edit, :update, :destory]
  def index
    @appointments = @doctor.appointments
  end

  def show
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path(doctor_id)
    else
      render :edit
    end
  end

  def destory
    @appointments = @doctor.appointments.find(params[:id])
    @appointment.destory
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
    def appointment_params
      params.require(:appointment).permit(:appointment_type, :appointment_time)
    end
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end
    def set_patient 
      @patient = Patient.find(params[:patient_id])
    end
end
