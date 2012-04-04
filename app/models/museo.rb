class Museo < ActiveRecord::Base
    has_one :ficha,:dependent=>:destroy
    has_many :espacios,:dependent=>:destroy
end
