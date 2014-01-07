class Authorization < ActiveRecord::Base
    belongs_to :user
    belongs_to :language
    validates :provider, :user_id, :uid, presence: true
end
