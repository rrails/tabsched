class MedicationsController < ApplicationController
  def index
    @medications = current_user.medications
  end

  def new
    @medication = Medication.new
      1.times{
        roster = @medication.rosters.build
      }
    @schedule = Schedule.new
  end

  def create
    @medication = Medication.new(params[:medication])
    @medication.user_id = current_user.id
    @medication.save
    @schedule = Schedule.new

    params[:medication][:rosters_attributes].each do |key,value|
      schedule_rule = @schedule.create_schedule(value)
      @schedule.schedule_rule = schedule_rule.to_hash
      @schedule.next_occurrence = schedule_rule.next_occurrence()
      @schedule.dosage = value[:dosage]
      @schedule.medication_id = @medication.id
      @schedule.user_id = current_user.id
      @schedule.save
    end

    redirect_to(medications_path)
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
    @medication = Medication.find(params[:id])
    @medication.update_attributes(params[:medication])
    #    params[:medication][:rosters_attributes].each do |key,value|

    #   schedule_rule = @schedule.create_schedule(value)
    #   @schedule.schedule_rule = schedule_rule.to_hash
    #   @schedule.next_occurrence = schedule_rule.next_occurrence()
    #   @schedule.dosage = value[:dosage]
    #   @schedule.medication_id = @medication.id
    #   @schedule.user_id = current_user.id
    #   @schedule.save
    # end
    redirect_to(medications_path)
  end

  def destroy
    # binding.pry
    medication = Medication.find(params[:id])
    medication.destroy

    # render :json => [task]
  end



end