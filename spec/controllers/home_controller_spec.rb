require 'spec_helper'

describe HomeController do
  before do
    get :index
  end

  describe "GET #index" do
   it 'should respond with a status 200' do
      expect(response.status).to eq(200)
    end
  end

end