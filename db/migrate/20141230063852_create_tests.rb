class CreateTests < ActiveRecord::Migration
  def self.up
    create_table :tests do |t|
      t.string :name
      t.string :unit
      t.timestamps
    end
    
    Test.create(:name => "Lymphocytes", :unit => "Cells/Cu.mm")
    Test.create(:name => "Platelet count", :unit => "Lakhs/Cu.mm")
    Test.create(:name => "S.g.o.t.", :unit => "U/L")
    Test.create(:name => "S.g.p.t.", :unit => "U/L")
    Test.create(:name => "Total albumin", :unit => "g/dl")
    Test.create(:name => "Total globulin", :unit => "g/dl")
  end

  def self.down
    drop_table :tests
  end
end
