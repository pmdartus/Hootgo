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

  it "should create user from oauth" do
    auth = OmniAuth.config.mock_auth[:twitter]
    user = User.create_with_oauth(auth)
    user.name.should eq("hootgo_test")
  end
end
