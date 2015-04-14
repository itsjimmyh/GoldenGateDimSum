# == Schema Information
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default("Your First Name"), not null
#  last_name              :string           default("Your Last Name"), not null
#  nickname               :string           default("Your Nickname")
#  delivery_address       :string           default("Your Delivery Address")
#  apartment              :string           default("Your Apt #")
#  city                   :string           default("Your City")
#  zip                    :integer          default("0")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

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
