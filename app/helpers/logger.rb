# require 'singleton'

# class Logger
#   include Singleton

#   # @@instance = Logger.new()
#   # def self.instance
#   #   return @@instance
#   # end

#   def self.log(user_id, medication_id, timeperiod_id = nil, time_due, date_due, status)
#     @journal = Journal.new
#     binding.pry
#     @journal.user_id = user_id
#     @journal.medication_id = medication_id
#     @journal.timeperiod_id || nil
#     @journal.time_due = next_occurrence
#     @journal.date_due = next_occurrence
#     @journal.status = status
#     @journal.save
#   end

#   # private_class_method :new
# end