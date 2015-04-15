class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      ## Many things could have images
      t.integer :imageable_id,        null: false
      t.string  :imageable_type,      null: false

      ## Item Filepicker URL
      t.string  :filepicker_url,      null: false, default: "defaults/defaultfood.png"

    end

    add_index :images, :imageable_id
    add_index :images, :imageable_type
  end
end
