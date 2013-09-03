class JournalsController < ApplicationController
  def index
    @journals = Journal.due.where({:user_id => current_user.id})
  end

  def bulk_edit
    @journals = Journal.due.where({:user_id => current_user.id})
  end

  def taken
    journal = Journal.find(params[:id])
    # date taken
    medication = Medication.find(journal.medication_id)
    medication.update_stock(journal.dosage)
    journal.update_attribute(:status, Journal::STATUS_TAKEN)
    redirect_to(bulk_edit_journals_path)
  end

  def skip
    journal = Journal.find(params[:id])
    # date updated
    journal.update_attribute(:status, Journal::STATUS_SKIPPED)
    redirect_to(bulk_edit_journals_path)
  end

end