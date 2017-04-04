class User < ApplicationRecord
  validates_presence_of :email, :role
  validates_uniqueness_of :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :cases

  enum role: {
  	regular: 'regular',
  	support: 'support'
  }
end
