# == Schema Information
#
# Table name: rosters
#
#  id               :integer          not null, primary key
#  frequencytype_id :integer
#  starting_date    :datetime
#  ending_date      :datetime
#  last_taken       :datetime
#  user_id          :integer
#  medication_id    :integer
#  group_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  frequency        :string(255)
#

class Roster < ActiveRecord::Base
  attr_accessible :frequencytype_id,:frequency,:starting_date, :ending_date, :last_taken, :user_id,:medication_id,:group_id
  belongs_to :user

end
