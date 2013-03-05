class CreateJars < ActiveRecord::Migration
  def change
    create_table :jars do |t|
      t.integer :jarIndex
      t.float :jarVolts
      t.integer :voltState
      t.integer :jarG
      t.integer :jarGState
      t.integer :jarPctRev

      t.timestamps
    end
  end
end
