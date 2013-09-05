class JournalsController < ApplicationController
  def index
    @journals = Journal.due.where({:user_id => current_user.id})
  end

  def bulk_edit
    if (params[:journal] != nil)
      if (params[:journal][:status] == Journal::STATUS_TAKEN)
        journal = Journal.find(params[:journal][:id])
        # update date taken
        binding.pry
        medication = Medication.find(journal.medication_id)
        medication.update_stock(journal.dosage)
        journal.update_attribute(:status, Journal::STATUS_TAKEN)
      elsif (params[:journal][:status] == Journal::STATUS_SKIPPED)
        journal = Journal.find(params[:journal][:id])
        # date updated
        journal.update_attribute(:status, Journal::STATUS_SKIPPED)
      end
    end

    @journals = Journal.due.where({:user_id => current_user.id})

    respond_to do |format|
      format.html {}
      format.json  {render :json => @journals}
    end
  end

  def history
    @journals = Journal.history.where({:user_id => current_user.id})
  end

end