class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :menu_item
end
