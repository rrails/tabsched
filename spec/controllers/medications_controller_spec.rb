require 'spec_helper'

describe MedicationsController do
  include Devise::TestHelpers

  describe 'Show medication' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
      get :index
    end
    it 'should respond with a status of 200' do
      expect(response).to be_success
      expect(response).to render_template("index")
    end
  end

  describe 'Create medication' do
    before do
      @medication = Medication.new(:medication_name => 'Panadol', :expiry_date => "12/3/2013", :stock_quantity=> 10)
      @medication.save
    end
    it "should create the medication" do
      @medication.reload
      @medication = Medication.find(@medication.id)
      @medication.medication_name.should  == "Panadol"
    end
  end

  describe 'Update medication' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
      @medication = Medication.create(:medication_name => 'Panadol', :expiry_date => "12/3/2013", :stock_quantity=> 10)
    end

    let(:medication)  {Medication.find @medication.id}
    subject{medication}

    it "should update the medication" do
      put :update, {:id => medication.id, :medication =>{ :stock_quantity  => 12}}
      medication.reload
      medication.stock_quantity.should eq(12)
      expect(response).to(redirect_to(medications_path))

    end



  end


end
