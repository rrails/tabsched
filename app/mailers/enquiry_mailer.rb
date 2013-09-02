class EnquiryMailer < ActionMailer::Base
    default from:'tabsched@gmail.com'


  def enquiry_email(medication_id) #this is called from enquiries controller.


    @enquiry = Enquiry.new
    medication = Medication.find(medication_id)
    @enquiry.body = medication.medication_name
    user = User.where(:id => medication.user_id).first
    @enquiry.subject = 'Reminder to take your tablets'
    mail_to = user.email
    # mail(to: mail_to,subject: @enquiry.subject)
    binding.pry

    @journal = Journal.new
    @journal.user_id = user.user_id
    @journal.medication_id = medication.medication_id
    @journal.timeperiod_id =  nil
    # @journal.time_due = i.next_occurrence
    # @journal.date_due = i.next_occurrence
    @journal.status = Journal::STATUS_NOTIFIED_MAIL
    @journal.save
  end
end