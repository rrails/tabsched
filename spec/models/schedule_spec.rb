require 'spec_helper'

describe Schedule do
  describe 'A valid schedule' do
    it { should belongs_to(:medication) }
  end
end
