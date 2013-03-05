class AddSiteIdToJar < ActiveRecord::Migration
  def change
    add_column :jars, :site_id, :integer
  end
end
