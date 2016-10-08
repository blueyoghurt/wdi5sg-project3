class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :contact
      t.boolean :is_biz
      t.boolean :is_seeker
      t.boolean :is_admin

      t.timestamps
    end
  end
end
