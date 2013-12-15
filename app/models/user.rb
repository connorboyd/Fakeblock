class User < ActiveRecord::Base

	has_many :user_friend_relations
	has_many :users, through: :user_friend_relations


	require 'digest/sha1'

	before_save :encrypt_password
	after_save :clear_password

	def get_friends_ids
		@list1 = UserFriendRelation.where(user_id1: self.id).map { |relation| relation.user_id2  }
		@list2 = UserFriendRelation.where(user_id2: self.id).map { |relation| relation.user_id1  }

		@list1.concat(@list2)
	end

	def get_friend_objects
		get_friends_ids.map { |friend_id| User.find(friend_id)  }
	end

	def encrypt_password
		if password.present?
			self.password = Digest::SHA1.hexdigest(self.password)
		end
	end

	def clear_password
		self.password = nil
	end

	def self.authenticate(user_email="", login_password="")
		user = User.find_by_email(user_email)

		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	def match_password(login_password = "")
		password == Digest::SHA1.hexdigest(login_password)
	end
	# encrypted_password= Digest::SHA1.hexdigest(password)

	# attr_accessor :password
	EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create
end
