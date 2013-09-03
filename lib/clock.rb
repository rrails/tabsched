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
  reminders.each do |reminder|
    next_schedule = reminder.set_nextoccurrence(reminder)
    binding.pry
    Journal.journalise(next_schedule.user_id, next_schedule.medication_id, nil, next_schedule.previous_occurrence, next_schedule.next_occurrence,next_schedule.dosage, Journal::STATUS_DUE)
    # next_schedule.delay.send_email_message
    next_schedule.delay.send_sms
  end
end
}

