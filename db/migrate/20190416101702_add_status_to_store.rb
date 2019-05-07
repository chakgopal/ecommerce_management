class AddStatusToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :status, :integer
  end
end
