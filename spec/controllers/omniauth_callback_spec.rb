require 'spec_helper'

describe Users::OmniauthCallbacksController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "Not loged user callback" do
    before(:each) do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end

    describe "create and sign in user with the right app" do
      before { get :twitter }

      it {should redirect_to(root_url)}
      it "should create a user all params" do
        u = User.first
        u.authorizations.count.should eq(1)
        u.pages.count.should eq(1)
        u.pages.first.name.should eq('hootgo_test')
        u.name.should eq('hootgo_test')
        session[:user_id].should eq(1)
      end
    end

    describe "already registered user but not signed in" do
      before do
        user = FactoryGirl.create(:user)
        auth = FactoryGirl.create(:authorization, user_id: user.id)
        get :twitter
      end

      it {should redirect_to(root_url)}
      it "should log the user" do
        User.count.should eq(1)
        Authorization.count.should eq(1)
      end
    end
  end

  describe "Loged user callback" do
    before(:each) do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end

    describe "add a new page" do
      before do
        sign_in FactoryGirl.create(:user)
        get :twitter
      end

      it {should redirect_to(pages_path)}
      it { should set_the_flash.to('Account successfully linked') }
      it "should log the user" do
        User.first.pages.first.name.should eq('hootgo_test')
      end
    end

    describe "already linked user" do
      before do
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:authorization, user_id: user.id)
        sign_in user
        get :twitter
      end

      it {should redirect_to(pages_path)}
      it { should set_the_flash.to('Account already linked') }
    end
  end
end
