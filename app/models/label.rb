

class Label < ActiveRecord::Base
  belongs_to :label
  has_many :labels,:dependent=>:destroy
  has_and_belongs_to_many :genericas
  
 
end
