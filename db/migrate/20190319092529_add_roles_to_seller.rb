class AddRolesToSeller < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :role, :integer
  end
end
