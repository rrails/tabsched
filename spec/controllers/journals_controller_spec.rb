require 'spec_helper'

describe JournalsController do
  include Devise::TestHelpers

  describe 'Index journal' do
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

end
