# == Schema Information
#
# Table name: medicationtypes
#
#  id              :integer          not null, primary key
#  medication_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Medicationtype < ActiveRecord::Base
  attr_accessible :medication_type
end
