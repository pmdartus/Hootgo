require 'spec_helper'

describe PagesController do

  context "GET /pages" do
    require_logged_user(:index)
  end
end
