class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :step
      t.text :description
      t.integer :time
      t.string :category

      t.timestamps
    end
  end
end
