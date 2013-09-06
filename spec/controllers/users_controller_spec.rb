require 'spec_helper'

describe UsersController do
  include Devise::TestHelpers

  describe 'Edit user' do
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
      expect(response).to(redirect_to(user_path))
    end
  end

  describe 'Show user' do
    before do
      @user = User.create(:email => 'roger@gmail.com', :password => "a", :password_confirmation => "a")
      sign_in @user
      get :show , :id => @user.id
    end

    it "should find the user" do
      @user.id.should_not be_nil
      @user.email.should == "roger@gmail.com"
    end
  end
end
