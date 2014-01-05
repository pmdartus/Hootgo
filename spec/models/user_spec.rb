require 'spec_helper'

describe User do
  it {should have_many(:campaigns)}

  it "have a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should have no credit after the creation" do
    user = FactoryGirl.create(:user)
    user.credits.should eq(0)
  end
end
