class Relacion < ActiveRecord::Base
  
  belongs_to :museo_origen, :class_name => "Museo"
  belongs_to :museo_fin, :class_name => "Museo"
  belongs_to :generica_origen, :class_name => "Generica"
  belongs_to :generica_fin, :class_name => "Generica"
  belongs_to :sentido_relacion, :class_name => "SentidoRelacion"
end
