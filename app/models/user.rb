class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

           has_many :reviews, dependent: :destroy
             has_many :favorites, dependent: :destroy
	
	def initials 
		return 'Anonymous' if !first_name || !last_name
		first_name.try(:first) + '+' + last_name.try(:first) + '.'
	end

	def full_name
		return 'Anonymous' if !first_name || !last_name
		first_name + '' + last_name
	end
end
