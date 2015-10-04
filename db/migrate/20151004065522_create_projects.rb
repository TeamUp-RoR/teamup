class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :goals
      t.text :features
      t.integer :members_limit
      t.string :domain
      t.string :language

      t.timestamps null: false
    end
  end
end
