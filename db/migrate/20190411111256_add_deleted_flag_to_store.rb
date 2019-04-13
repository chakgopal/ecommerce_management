class AddDeletedFlagToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :deleted_flag, :boolean
  end
end
