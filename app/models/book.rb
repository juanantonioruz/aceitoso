class Book < ActiveRecord::Base
      acts_as_heir_of :product

end
