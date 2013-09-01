# == Schema Information
#
# Table name: frequencytypes
#
#  id             :integer          not null, primary key
#  frequency_type :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Frequencytype < ActiveRecord::Base
  attr_accessible :frequency_type
end
