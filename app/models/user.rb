class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable,  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,
   :provider, :uid, :name, :oauth_token, :oauth_expires_at, :fname, :lname, :user_type, :username

   validates :email, :uniqueness => { :case_sensitive => false }
 
 
   validates_presence_of :fname
   validates_presence_of :lname

    has_attached_file :photo,
	:default_url => '/assets/default1.gif'

	has_many :experiences

	 def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	   	user.email2 = auth.info.email
	   	user.email = auth.provider + " - "+ auth.info.email
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
