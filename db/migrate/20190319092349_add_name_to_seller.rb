class AddNameToSeller < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :name, :string
  end
end
