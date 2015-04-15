# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  item           :integer          not null
#  filepicker_url :string           default("defaults/defaultfood.png"), not null
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end
