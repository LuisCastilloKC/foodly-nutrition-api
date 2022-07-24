class PatientsController < ApplicationController

    def index
        patients = Patient.all
        render json: patients
    end

    def create
        patient = Patient.create(patient_params)

        if patient.save
            render json: patient, status: :created
        else
            render json: patient.errors, status: :unprocessable_entity
        end
    end

end