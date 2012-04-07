class Label < ActiveRecord::Base
  belongs_to :label
  has_many :labels,:dependent=>:destroy
  has_and_belongs_to_many :genericas
  has_and_belongs_to_many :fichas
  has_and_belongs_to_many :piezas
  has_and_belongs_to_many :espacios
  has_and_belongs_to_many :eventos
  has_and_belongs_to_many :premios
  has_and_belongs_to_many :publicacions
 
end
