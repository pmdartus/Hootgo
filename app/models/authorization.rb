class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, presence: true

  def self.find_with_oauth(auth)
    find_by provider: auth.provider, uid: auth.uid
  end

  def self.create_with_oauth(auth)
    create(uid: auth.uid, provider: auth.provider)
  end

end
