class ReminderMailer < ActionMailer::Base
    default from:'wdi.sydney@gmail.com'

  def reminder_email(medication_id,previous_occurrence,dosage) #this is called from schedule.rb
    @medication = Medication.find(medication_id)
    @dosage = dosage
    user = User.where(:id => @medication.user_id).first
    @subject = 'Reminder to take your medication'
    mail_to = user.email
    mail(to: mail_to,subject: @subject)
    #need to get the due date
    Journal.journalise(user.id, @medication.id,nil,nil,previous_occurrence,nil,dosage, Journal::STATUS_NOTIFIED_MAIL)
  end
end