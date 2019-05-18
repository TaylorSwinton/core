class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :name
      t.text :description
      t.integer :time
      t.string :category

      t.timestamps
    end
  end
end
