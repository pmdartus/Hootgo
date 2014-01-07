require 'spec_helper'

describe Language do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }

  it "has a valid factory" do
    FactoryGirl.create(:language).should be_valid
  end

  it "shouldn't store duplicate langage" do
    FactoryGirl.create(:language)
    FactoryGirl.build(:language).should_not be_valid
  end
end
