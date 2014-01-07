class Authorization < ActiveRecord::Base
    belongs_to :user
    validates :provider, :user_id, :uid, presence: true
end
