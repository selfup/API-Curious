class User < ActiveRecord::Base
  def self.from_omniauth(auth)
      user = User.find_or_create_by(provider: auth.provider, uid: auth.provider)

      user.email     = auth.info.email
      user.name      = auth.info.name
      user.nickname  = auth.info.nickname
      user.image_url = auth.info.image
      user.followers = auth.extra.raw_info.followers
      user.following = auth.extra.raw_info.following
      user.location  = auth.extra.raw_info.location
      user.token     = auth.credentials.token
      user.save

      user
    end
end
