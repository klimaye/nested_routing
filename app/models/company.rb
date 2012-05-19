class Company < ActiveRecord::Base
  has_many  :pharmacies
end
