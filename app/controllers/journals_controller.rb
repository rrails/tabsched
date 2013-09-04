class JournalsController < ApplicationController
  def index
    @journals = Journal.due.where({:user_id => current_user.id})
  end

  def bulk_edit
    if (params[:status] == Journal::STATUS_TAKEN)
      journal = Journal.find(params[:id])
     # date taken
      medication = Medication.find(journal.medication_id)
    binding.pry

      medication.update_stock(journal.dosage)
      journal.update_attribute(:status, Journal::STATUS_TAKEN)
    elsif (params[:status] == Journal::STATUS_SKIPPED)
      journal = Journal.find(params[:id])
      # date updated
      journal.update_attribute(:status, Journal::STATUS_SKIPPED)
    end
    @journals = Journal.due.where({:user_id => current_user.id})
  end

end