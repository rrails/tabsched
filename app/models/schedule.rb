# == Schema Information
#
# Table name: schedules
#
#  id                  :integer          not null, primary key
#  schedule_rule       :text
#  next_occurrence     :datetime
#  user_id             :integer
#  medication_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  previous_occurrence :datetime
#  dosage              :integer
#

class Schedule < ActiveRecord::Base
  include IceCube
  serialize :schedule_rule, Hash
  attr_accessible :user_id,:next_occurrence,:medication_id, :previous_occurrence
  belongs_to :medication

# need to add validation for end date etc

  def create_schedule(value)
    # Parse the the params to get the frequency rule type,start and end dates. These are required by the
    # ice cube to create the recurrence rule.

    frequency = JSON.parse(value[:frequency])['rule_type']
    start_date = value[:starting_date].to_datetime
    end_date = value[:ending_date].to_datetime
    reminder_time = Timeperiod.find(value[:group_id]).time_of_day
    end_date ||= start_date + 30.days
    s = IceCube::Schedule.new(start_date)

    # Passing the parameters to ice cube to create the schedule.
    case frequency
      when "IceCube::DailyRule"
       s.add_recurrence_rule IceCube::Rule.daily(1).hour_of_day(reminder_time.hour).minute_of_hour(reminder_time.min).second_of_minute(0).until(end_date)
      when 'IceCube::WeeklyRule'
        days = JSON.parse(value[:frequency])['validations']['day']
        s.add_recurrence_rule IceCube::Rule.weekly(1).day(*days).hour_of_day(reminder_time.hour).minute_of_hour(reminder_time.min).second_of_minute(0).until(end_date)
    end
    return s
  end

  def send_email_message
    ReminderMailer.reminder_email(self.medication_id,self.previous_occurrence,self.dosage).deliver
  end


  def send_sms

    medication = Medication.find(self.medication_id)
    body = medication.medication_name
    user = User.where(:id => medication.user_id).first

    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+17863759474',
                                       :to => user.mobile_phone,
                                       :body => body)

    Journal.journalise(user.id, medication.id, nil, nil, self.previous_occurrence,nil, self.dosage, Journal::STATUS_NOTIFIED_SMS)
  end


  def set_nextoccurrence(id)
    # Once the messages are queued for sending out - the next occurrence date is generated.
    @next = ::Schedule.find(id.id)
    @new_schedule = Schedule.from_hash(@next.schedule_rule)
    @next.previous_occurrence = @next.next_occurrence
    @next.next_occurrence = @new_schedule.next_occurrence()
    @next.save
    @next
  end
end
