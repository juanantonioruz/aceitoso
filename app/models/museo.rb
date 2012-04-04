class Museo < ActiveRecord::Base
    has_one :ficha,:dependent=>:destroy
    has_many :espacios,:dependent=>:destroy
    has_many :piezas,:dependent=>:destroy
end
