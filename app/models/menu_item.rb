# == Schema Information
#
# Table name: menu_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             default("Item Description"), not null
#  price       :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MenuItem < ActiveRecord::Base
  include Taggable

  validates :name, :description, :price,
              presence: true
  validates :name,
              uniqueness: true

  before_save do |item|
    item.name.downcase!
  end

  has_many :images

end
