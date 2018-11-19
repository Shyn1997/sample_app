class ChangeColumNameToGenderes < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :sex, :gender
  end
end
