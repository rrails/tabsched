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
  attr_accessible :time_of_day,:timeperiodname_id, :user_id
  belongs_to :users
  belongs_to :timeperiodname
end
