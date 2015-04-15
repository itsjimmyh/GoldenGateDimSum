class CreateMenuItem < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|

      ## Item Name
      t.string  :name,              null: false, unique: true

      ## Item Description
      t.text    :description,       null: false, default: "Item Description"

      ## Item Price
      t.float   :price,             null: false

      t.timestamps                  null: false
    end

    add_index :menu_items, :name,   unique: true
  end
end
