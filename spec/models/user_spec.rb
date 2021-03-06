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

require 'spec_helper'

describe User do
  describe 'A valid user' do
    before do
      @user = FactoryGirl.create(:user)
    end
    it "has a password" do
      @user.password.should eq('first')
    end
  end

  describe User do
    it { should have_many(:journals) }
    it { should have_many(:timeperiods) }
    it { should have_many(:medications) }
  end
end