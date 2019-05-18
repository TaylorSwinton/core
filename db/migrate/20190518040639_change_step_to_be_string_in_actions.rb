class ChangeStepToBeStringInActions < ActiveRecord::Migration[5.2]
  def change
    change_column :actions, :step, :string
  end
end
