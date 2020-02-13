class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :lname
      t.string :fname
      t.string :email
      t.text :thumbnail

      t.timestamps
    end
  end
end
