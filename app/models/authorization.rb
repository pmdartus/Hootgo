class Authorization < ActiveRecord::Base
    belongs_to :user
    validates :provider, :user_id, :uid, presence: true

    def self.create_from_auth(auth, user)
        user = User.create(provider:auth.provider,
                           uid:auth.uid,
                           user: user
                           )
    end
end
