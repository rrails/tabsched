class JournalsController < ApplicationController
  def bulk_edit
    # update the journal to reflect user input for dosage taken or skipped.
    if (params[:journal] != nil)
      if (params[:journal][:status] == Journal::STATUS_TAKEN)
        journal = Journal.find(params[:journal][:id])
        medication = Medication.find(journal.medication_id)
        medication.update_stock(journal.dosage)
        journal.update_attributes({:status => Journal::STATUS_TAKEN, :date_taken =>Time.now()})
      elsif (params[:journal][:status] == Journal::STATUS_SKIPPED)
        journal = Journal.find(params[:journal][:id])
        journal.update_attribute(:status, Journal::STATUS_SKIPPED)
      end
    end

    @journals = Journal.due.where({:user_id => current_user.id}).order(:next_due)

    respond_to do |format|
      format.html {}
      format.json  {render :json => @journals}
    end
  end

  def history
    # need to sort by date
    if params[:medication_name]
      @journals = Journal.history.where({:user_id => current_user.id, :medication_id => params[:medication_name][:id]})
    else
      @journals = Journal.history.where({:user_id => current_user.id}).order(:status).reverse
    end
  end

end