# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  mobile_phone              :string(255)
#  mobile_phone_notification :boolean
#  email_notification        :boolean
#  email                     :string(255)      default(""), not null
#  encrypted_password        :string(255)      default(""), not null
#  reset_password_token      :string(255)
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0)
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string(255)
#  last_sign_in_ip           :string(255)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         # , :validatable
  # attr_accessible :title, :body
  has_many :timeperiods, :dependent => :destroy
  has_many :medications, :dependent => :destroy
  attr_accessible :first_name, :last_name,:email, :mobile_phone,:password,:password_confirmation,:mobile_phone_notification,:email_notification,
                  :timeperiods_attributes
  accepts_nested_attributes_for :timeperiods, :reject_if => lambda { |a| a[:timeperiodname_id].blank? }, :allow_destroy => true

end
