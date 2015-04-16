class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password, limit: 24

      t.timestamps null: false
    end
  end
end
