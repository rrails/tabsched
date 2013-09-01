# == Schema Information
#
# Table name: timeperiodnames
#
#  id               :integer          not null, primary key
#  time_period_name :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Timeperiodname < ActiveRecord::Base
  attr_accessible :time_period_name
end
