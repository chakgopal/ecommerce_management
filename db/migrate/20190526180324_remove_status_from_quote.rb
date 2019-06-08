class RemoveStatusFromQuote < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :status, :integer
  end
end
