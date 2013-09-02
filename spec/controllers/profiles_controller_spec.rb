require 'spec_helper'

describe ProfilesController do
 describe 'Edit Profile' do
    before do
      @user = User.create(:name => 'Roger', :password => "a", :password_confirmation => "a")
    end

    let(:user)  {User.find @cuser.id}
    subject{user}

    it "should find the user" do
      user.id.should_not be_nil
      user.name == "Roger"
    end

    it "should update the user" do
      put :update, {:id => user.id, :user =>{ :email  => "roger@gmail.com"}}
      user.reload
      user.email.should eq("roger@gmail.com")
    end

    # it "should redirect the user to restaurant finder" do
    #   put :update, {:id => user.id, :user =>{ :address  => "123"}}
    #   user.reload
    #   expect(response.status).to eq(302)
    #   expect(response).to(redirect_to(restaurants_path))
    # end
  end
end
