class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name,
            presence: true

  validates :email,
            uniqueness: true

  before_save do |user|
    user.first_name.capitalize!
    user.last_name.capitalize!
    user.email.downcase!
  end
end
