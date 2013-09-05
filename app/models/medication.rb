# == Schema Information
#
# Table name: medications
#
#  id                 :integer          not null, primary key
#  medication_name    :string(255)
#  stock_quantity     :integer
#  expiry_date        :datetime
#  directions         :string(255)
#  notes              :string(255)
#  archive            :boolean
#  medication_type_id :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


class Medication < ActiveRecord::Base
  attr_accessible :medication_name, :stock_quantity, :expiry_date, :directions,:notes, :archive,:medication_type_id,
                  :user_id,:recurring_rules,:rosters_attributes
  belongs_to :users
  has_many :rosters
  has_many :journals

  accepts_nested_attributes_for :rosters, :reject_if => lambda { |a| a[:frequency].blank? }, :allow_destroy => true

  def update_stock(dosage)
    self.stock_quantity = self.stock_quantity - dosage
  end

end
