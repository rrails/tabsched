require 'spec_helper'

describe UsersController do
  include Devise::TestHelpers

 describe 'Edit Profile' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
    end

    let(:user)  {User.find @user.id}
    subject{user}

    it "should find the user" do
      user.id.should_not be_nil
      user.email == "roger@gmail.com"
    end

    it "should update the user" do
      put :update, {:id => user.id, :user =>{ :first_name  => "Roger"}}
      user.reload
      user.first_name.should eq("Roger")
    end


  end
end
