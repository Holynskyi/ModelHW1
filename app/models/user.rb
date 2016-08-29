class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :account

  devise :omniauthable, :omniauth_providers => [:google_oauth2]


	def self.from_omniauth(access_token)
	 data = access_token.info
	 user = User.where(email: data["email"]).first

	 # Uncomment the section below if you want users to be created if they don't exist
	 # unless user
	 #     user = User.create(name: data["name"],
	 #        email: data["email"],
	 #        password: Devise.friendly_token[0,20]
	 #     )
	 # end
	 user
	end
 # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end