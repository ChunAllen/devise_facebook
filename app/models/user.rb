class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,
   :provider, :uid, :name, :oauth_token, :oauth_expires_at, :fname, :lname
  # attr_accessible :title, :body

  validates_presence_of :name
  validates_uniqueness_of :name

    has_attached_file :photo,
:default_url => '/assets/default1.gif'


	 def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	     user.name = auth.info.name #for getting name from facebook and store it in signup
	   	#user.email = auth.info.email
	    user.fname = auth.info.first_name
	    user.lname = auth.info.last_name

	  end
	end


	def self.new_with_session(params, session)
		  if session["devise.user_attributes"]
		    new(session["devise.user_attributes"], without_protection: true) do |user|
		      user.attributes = params
		      user.valid?
		    end
		  else
		    super
		  end    
	end


	def password_required?
  		super && provider.blank?
	end

	def email_required?
  		super && provider.blank?
	end

end
