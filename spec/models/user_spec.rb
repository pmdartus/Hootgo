require 'spec_helper'

describe User do
  it {should have_many(:campaigns).dependent(:destroy)}
  it {should have_many(:pages)}
  it {should have_many(:authorizations).dependent(:destroy)}

  it "have a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should have no credit after the creation" do
    user = FactoryGirl.create(:user)
    user.credits.should eq(0)
  end

  it "should validate that user has enough credits" do
    user = FactoryGirl.create(:user)
    user.credits -= 100
    user.should_not be_valid
  end

  it "should return a valid formatted get_credits" do
    user = FactoryGirl.create(:user)
    user.get_credits.should eq("0.00")

    user.credits = 500
    user.get_credits.should eq("5.00")
  end

  it "should create user from oauth" do
    auth = OmniAuth.config.mock_auth[:twitter]
    user = User.create_with_oauth(auth)
    user.name.should eq("hootgo_test")
  end
end
