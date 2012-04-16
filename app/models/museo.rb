class Museo < ActiveRecord::Base
    has_one :ficha,:dependent=>:destroy
    has_many :espacios,:dependent=>:destroy
    
     has_many :relaciones_origen,:dependent=>:destroy,:class_name => "Relacion", :foreign_key=>"museo_origen_id"
     has_many :relaciones_fin,:dependent=>:destroy, :class_name => "Relacion", :foreign_key=>"museo_fin_id"
    
    has_many :piezas,:dependent=>:destroy
    has_many :eventos,:dependent=>:destroy
    has_many :premios,:dependent=>:destroy
    has_many :publicacions,:dependent=>:destroy
    has_many :infos,:dependent=>:destroy
    has_many :servicios,:dependent=>:destroy
    has_one :entorno,:dependent=>:destroy

    ###Habilitar las consultas @museo.hitos, @museo.caminos
    has_many :hitos,:through=>:entorno
    has_many :urbanos,:through=>:entorno
    has_many :caminos,:through=>:entorno


end
