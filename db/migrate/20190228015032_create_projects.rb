class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.decimal :funding
      t.decimal :goal
      t.date :deadline

      t.timestamps
    end
  end
end
