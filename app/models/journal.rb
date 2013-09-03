# == Schema Information
#
# Table name: journals
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  medication_id :integer
#  timeperiod_id :integer
#  date_due      :datetime
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  dosage        :integer
#  parent_id     :integer
#  date_taken    :datetime
#  next_due      :datetime
#


class Journal < ActiveRecord::Base
  attr_accessible :user_id, :medication_id, :timeperiod_id, :date_taken, :date_due, :next_due,:status, :parent_id,:dosage
  belongs_to :user
  belongs_to :medication


  STATUS_DUE = 'Due'
  STATUS_NOTIFIED_SMS = 'Notified-SMS'
  STATUS_NOTIFIED_MAIL = 'Notified-mail'
  STATUS_TAKEN = 'Taken'
  STATUS_SKIPPED = 'Skipped'

  def self.journalise(user_id, medication_id, timeperiod_id = nil, date_taken, date_due, next_due, dosage,status)
binding.pry

    if status == STATUS_DUE
      journal = Journal.new
      journal.parent_id = nil
    else
      journal = Journal.new
      parent_journal = Journal.where({:user_id => user_id, :medication_id => medication_id, :date_due => date_due, :status =>STATUS_DUE }).first
      binding.pry
      journal.parent_id = parent_journal.id
    end


    journal.user_id = user_id
    journal.medication_id = medication_id

    journal.timeperiod_id = timeperiod_id || nil
    journal.dosage = dosage
    journal.date_taken = date_taken
    journal.date_due = date_due
    journal.next_due = next_due
    journal.status = status
    journal.save
  end

  def self.due
    where(:status => STATUS_DUE)
  end
end
