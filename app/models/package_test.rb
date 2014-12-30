class PackageTest < ActiveRecord::Base
  belongs_to :package
  belongs_to :test

  validates_associated :package
end
