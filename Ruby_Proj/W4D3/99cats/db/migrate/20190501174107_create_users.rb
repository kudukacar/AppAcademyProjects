class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :sesson_token, null: false
      t.index :sesson_token, unique: true
      t.timestamps
    end
  end
end
