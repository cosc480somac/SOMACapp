class User < ActiveRecord::Base
	has_many :positions
	has_many :certificates
	has_many :roles
	accepts_nested_attributes_for :certificates
	has_and_belongs_to_many :events, :uniq => true	

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model


 attr_accessible :email, :password, :password_confirmation, :remember_me,
		:first_name, :last_name, :phone, :certificates_attributes, :role, :name
  # attr_accessible :title, :body

 ROLES = %w[admin coordinator helper]

end
