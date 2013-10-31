class Translation < ActiveRecord::Base
  belongs_to :language
  belongs_to :campaign

  validates_presence_of :language, :status
end
