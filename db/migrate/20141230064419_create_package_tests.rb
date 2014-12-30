class CreatePackageTests < ActiveRecord::Migration
  def self.up
    create_table :package_tests do |t|
      t.references :package
      t.references :test

      t.timestamps
    end
    
  end

  def self.down
    drop_table :package_tests
  end
end
