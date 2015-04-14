# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :menu_items, through: :taggings

  # Override to_s method to show Tag Name, because #join calls #to_s
  def to_s
    name
  end
end
