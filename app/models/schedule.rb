# == Schema Information
#
# Table name: schedules
#
#  id              :integer          not null, primary key
#  schedule_rule   :text
#  next_occurrence :datetime
#  user_id         :integer
#  medication_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Schedule < ActiveRecord::Base
  include IceCube
  serialize :schedule_rule, Hash
  attr_accessible :user_id,:next_occurrence,:medication_id
# need to add validation for end date etc
  def create_schedule(start_date,end_date,time,frequency,days_of_week=nil)
    reminder_time = Timeperiod.find(time).time_of_day
    end_date ||= start_date + 30.days
    s = IceCube::Schedule.new(start_date)
    case frequency
      when "IceCube::DailyRule"
       s.add_recurrence_rule IceCube::Rule.daily(1).hour_of_day(reminder_time.hour).minute_of_hour(reminder_time.min).second_of_minute(0).until(end_date)
      when 'weekly'
       # s.add_recurrence_rule IceCube::Rule.weekly(1).hour_of_day(time.hour).minute_of_hour(time.min).second_of_minute(0).until(end_date)
    end
    return s
  end

  def send_email_message
    EnquiryMailer.enquiry_email(self.medication_id).deliver
  end

  def send_sms

    medication = Medication.find(self.medication_id)
    body = medication.medication_name
    #subject = 'Reminder to take your tablets'
    user = User.where(:id => medication.user_id).first
    binding.pry

    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+17863759474',
                                       :to => user.mobile_phone,
                                       :body => body)
  end



  def set_nextoccurrence(id)
    @next = ::Schedule.find(id.id)
    @new_schedule = Schedule.from_hash(@next.schedule_rule)
    @next.next_occurrence = @new_schedule.next_occurrence()
    @next.save
  end
end