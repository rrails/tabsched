require 'spec_helper'

describe JournalsController do
  include Devise::TestHelpers

  describe 'history journal' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
      get :history
    end
    it 'should respond with a status of 200' do
      expect(response).to be_success
    end
  end

  describe 'history journal with a medication name' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
      @medication = Medication.new(:medication_name => 'Panadol', :expiry_date => "12/3/2013", :stock_quantity=> 10)
      @medication.save
      get :history,  :medication_name => "Panadol"
    end
    it 'should respond with a status of 200' do
      expect(response).to be_success
    end
  end


end
