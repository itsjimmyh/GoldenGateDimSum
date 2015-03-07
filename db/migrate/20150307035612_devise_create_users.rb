class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      ## Database authenticatable
      t.string :email,                       null: false, default: ''
      t.string :encrypted_password,          null: false, default: ''

      ## User Information
      t.string  :first_name,                 null: false, default: 'Your First Name'
      t.string  :last_name,                  null: false, default: 'Your Last Name'
      t.string  :nickname,                   default: 'Your Nickname'
      t.string  :delivery_address,           default: 'Your Delivery Address'
      t.string  :apartment,                  default: 'Your Apt #'
      t.string  :city,                       default: 'Your City'
      t.integer :zip                         default: 'Your Zip Code'

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count,             default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
