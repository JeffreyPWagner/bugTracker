class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.text :title
      t.text :description
      t.integer :issue_type
      t.integer :priority
      t.integer :status
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
