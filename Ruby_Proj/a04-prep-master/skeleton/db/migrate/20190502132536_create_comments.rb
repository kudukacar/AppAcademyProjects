class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, presence: {message: 'must exist can/t be blank'}
      t.integer :link_id, presence: {message: 'must exist can/t be blank'}
    end
  end
end
