class Post < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :page
  has_one :translation
end
