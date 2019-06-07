class AddVerifiedToStores < ActiveRecord::Migration[5.2]
  def change
     add_column :stores, :verified, :boolean, default: false
  end
end
