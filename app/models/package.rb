class Package < ActiveRecord::Base
  attr_accessible :name, :cost, :test_ids
  
  has_many :package_tests 
  has_many :tests, :through => :package_tests
  
  # Client requirement is drop-down interface for selection of multiple tests in package form. 
  # So I don't thing accepts_nested_attributes_for is suitable one to insert record in join table table(package_tests). 
  
  validate :at_most_3_tests

  private
  
  # I want to apply validation rule whenever package_tests record is created
  # Example validation. 
  def at_most_3_tests
    errors.add(:base, 'This package should have at most three tests') if  test_ids.count > 3
  end
end
