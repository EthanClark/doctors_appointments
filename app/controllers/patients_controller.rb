class PatientsController < ApplicationController
  before_action :
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@billboard.id)
    else
      render :new
    end
  end

  def edit
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
    redirect_to patient_path
  end

  private

  def set_patient
    @patient = Billboard.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name)
  end

end