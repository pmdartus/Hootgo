require 'spec_helper'

describe Authorization do
  it {should belong_to(:user)}
  it {should have_one(:page).dependent(:destroy)}
  it {should validate_presence_of(:uid)}
  it {should validate_presence_of(:provider)}

  describe "Oauth authorization" do
    before(:each) do
      @auth = OmniAuth.config.mock_auth[:twitter]
    end

    it "should create the linked page from a oauth request" do
      authorization = Authorization.create_with_oauth(@auth)

      authorization.page.present?.should eq(true)
      authorization.uid.should eq("12345")
      authorization.provider.should eq("twitter")
      authorization.oauth_token.should eq("token")
      authorization.oauth_secret.should eq("secret")
    end

    it "should retrieve form auth request" do
      fact = FactoryGirl.create(:authorization)
      fact.should eq(Authorization.find_with_oauth(@auth))
    end
  end
end
