# == Schema Information
#
# Table name: menu_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             default("Item Description"), not null
#  price       :float            not null
#

class MenuItem < ActiveRecord::Base

  validates :name, :description, :price,
              presence: true
  validates :name,
              uniqueness: true

  before_save do |item|
    item.name.downcase!
  end

  has_many :images
  has_many :taggings
  has_many :tags, through: :taggings


  ## Associated Tags for a MenuItem, returns as String
  def tag_list
    tags.join(", ")
  end

  ## Saving Tags
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
