class Label < ActiveRecord::Base
  belongs_to :label
  has_many :labels,:dependent=>:destroy
  has_and_belongs_to_many :genericas,:join_table=>'genericas_labels'
  has_and_belongs_to_many :fichas,:join_table=>'fichas_labels'
  has_and_belongs_to_many :piezas,:join_table=>'piezas_labels'
  has_and_belongs_to_many :espacios,:join_table=>'espacios_labels'
  has_and_belongs_to_many :eventos,:join_table=>'eventos_labels'

  has_and_belongs_to_many :publicacions,:join_table=>'publicacions_labels'

  ##### espacios: hitos, caminos, urbanos
  has_and_belongs_to_many :hitos,:join_table=>'hitos_labels'
  has_and_belongs_to_many :caminos,:join_table=>'caminos_labels'
  has_and_belongs_to_many :urbanos,:join_table=>'urbanos_labels'
 
end
