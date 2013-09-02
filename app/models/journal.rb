# == Schema Information
#
# Table name: journals
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  medication_id :integer
#  timeperiod_id :integer
#  time_due      :datetime
#  date_due      :datetime
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


class Journal < ActiveRecord::Base
  attr_accessible :user_id, :medication_id, :timeperiod_id, :time_due, :date_due, :status

  STATUS_DUE = 'Due'
  STATUS_NOTIFIED_SMS = 'Notified-SMS'
  STATUS_NOTIFIED_MAIL = 'Notified-mail'
  STATUS_TAKEN = 'Taken'
  STATUS_SKIPPED = 'Skipped'

  # def initialize()
  #   # @log = File.
  # end

  def self.journalise(user_id, medication_id, timeperiod_id = nil, time_due, date_due, status)
    journal = Journal.new
binding.pry

    journal.user_id = user_id
    journal.medication_id = medication_id
    journal.timeperiod_id = timeperiod_id || nil
    journal.time_due = time_due
    journal.date_due = date_due
    journal.status = status

    journal.save
  end
end
