class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :menu_items, through: :taggings

  # Override to_s method to show Tag Name, because #join calls #to_s
  def to_s
    name
  end
end
