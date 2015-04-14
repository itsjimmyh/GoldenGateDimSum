class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      ## Menu Item it belongs to
      t.integer :item,             null: false

      ## Item Filepicker URL
      t.string :filepicker_url,    null: false, default: "defaults/defaultfood.png"

    end

    add_index :images, :item
  end
end
