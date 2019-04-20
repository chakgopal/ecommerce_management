class AddDeletedFlagToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :deleted_flag, :boolean
  end
end
