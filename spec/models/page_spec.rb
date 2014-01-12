require 'spec_helper'

describe Page do
  it {should belong_to(:authorization)}
  it {should belong_to(:language)}

  it "should create user from oauth" do
    auth = OmniAuth.config.mock_auth[:twitter]
    user = Page.create_with_oauth(auth)
    user.name.should eq("hootgo_test")
  end
end
