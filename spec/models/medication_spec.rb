require 'spec_helper'

describe Medication do
  describe 'A valid medication' do
    before do
      @medication = FactoryGirl.create(:medication)
    end
    it "has a stock quantity of 10" do
      @medication.stock_quantity.should eq(10)
    end

  end
   describe Medication do
    it { should have_many(:rosters) }
    it { should have_many(:journals) }
    it { should have_many(:schedules) }
  end
end