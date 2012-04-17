class Relacion < ActiveRecord::Base

validates_presence_of :sentido_relacion, :origen, :fin
  belongs_to :sentido_relacion, :class_name => "SentidoRelacion"
  
  belongs_to :origen, :class_name => "Relacionable"
  belongs_to :fin, :class_name => "Relacionable"






end
