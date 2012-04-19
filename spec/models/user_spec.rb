require 'spec_helper'

describe User do

  describe "#max_user_accounts" do
    let(:user) do
      User.new
    end

    before(:each) do
      user.email = "user@example.com"
      user.password = "password"
    end

    it "should raise error if one account already exists" do
      Fabricate(:user)
      lambda { user.save! }.should raise_error
    end

    it "shouldn't raise error if no accounts exist" do
      lambda { user.save! }.should_not raise_error
    end
  end
end
