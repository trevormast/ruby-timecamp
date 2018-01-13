require 'spec_helper'

describe TimeCamp::User do
  describe '.get' do
    it 'gets users' do
      VCR.use_cassette('user/get') do
        user = TimeCamp::User.get
        expect(user.class).to eq(TimeCamp::User)
        expect(user.instance_variables).to include(:@group_id, :@user_id, :@email, :@login_count, :@login_time, :@display_name, :@synch_time)
      end
    end
  end
end