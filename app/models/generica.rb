class Generica < ActiveRecord::Base
    
    mount_uploader :imagen,ImagenUploader
    has_and_belongs_to_many :labels,:join_table=>'genericas_labels'
       has_many :relaciones_origen,:dependent=>:destroy,:class_name => "Relacion", :foreign_key=>"generica_origen_id"
       has_many :relaciones_fin,:dependent=>:destroy, :class_name => "Relacion", :foreign_key=>"generica_fin_id"

 
    def etiquetas
       self.labels.collect { |l| l.nombre+' ' } 
    end
   
    
end
