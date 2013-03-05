class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :address
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
    add_index :sites, [:user_id]
  end
end
