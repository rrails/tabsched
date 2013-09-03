class EnquiryMailer < ActionMailer::Base
    default from:'tabsched@gmail.com'

  def enquiry_email(medication_id,next_occurrence) #this is called from schedule.rb
    @enquiry = Enquiry.new
    medication = Medication.find(medication_id)
    @enquiry.body = medication.medication_name
    user = User.where(:id => medication.user_id).first
    @enquiry.subject = 'Reminder to take your tablets'
    mail_to = user.email
    # mail(to: mail_to,subject: @enquiry.subject)
    #need to get the due date
    Journal.journalise(user.id, medication.id,nil,nil,next_occurrence,nil,nil, Journal::STATUS_NOTIFIED_MAIL)
  end
end