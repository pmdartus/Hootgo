class Authorization < ActiveRecord::Base
  belongs_to :user
  has_one :page
  validates :provider, :uid, presence: true

  def self.find_with_oauth(auth)
    find_by provider: auth.provider, uid: auth.uid
  end

  def self.create_with_oauth(auth)
    page = Page.create_with_oauth(auth)
    authorization = Authorization.create(
      uid: auth.uid,
      provider: auth.provider,
      oauth_token: auth.credentials.token,
      oauth_secret: auth.credentials.secret,
      page: page
      )

    authorization
  end

end
