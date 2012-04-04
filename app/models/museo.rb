class Museo < ActiveRecord::Base
    has_one :ficha,:dependent=>:destroy
end
