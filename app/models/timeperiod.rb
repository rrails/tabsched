# == Schema Information
#
# Table name: timeperiods
#
#  id                :integer          not null, primary key
#  timeperiodname_id :text
#  time_of_day       :datetime
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Timeperiod < ActiveRecord::Base

end
