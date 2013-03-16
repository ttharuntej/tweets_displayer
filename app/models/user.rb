class User < ActiveRecord::Base

  has_many :posts

  attr_accessible :name, :provider, :uid

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.info.email
      if auth.provider == "facebook"
        user.oauth_token      = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
    end
  end

end
