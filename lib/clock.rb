require 'rubygems'
require 'clockwork'
include Clockwork
require File.expand_path('../../config/boot',  __FILE__)
require File.expand_path('../../config/environment',  __FILE__)

# how to run clock.rb from lib directory - clockwork clock.rb
every(2.minutes, 'reminder.deliver') {
  # what object is reminders
reminders = Schedule.find(:all, :conditions => ["next_occurrence <= ?", Time.now])
unless reminders.nil?
  reminders.each do |i|
    # l.log(i.user_id, i.medication_id, nil, i.next_occurrence, i.next_occurrence, Journal::STATUS_DUE)
    @journal = Journal.new
    binding.pry
    @journal.user_id = i.user_id
    @journal.medication_id = i.medication_id
    @journal.timeperiod_id =  nil
    @journal.time_due = i.next_occurrence
    @journal.date_due = i.next_occurrence
    @journal.status = Journal::STATUS_DUE
    @journal.save
    i.set_nextoccurrence(i)
    i.delay.send_email_message
    # i.delay.send_sms
  end
end
}

