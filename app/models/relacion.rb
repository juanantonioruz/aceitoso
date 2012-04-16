class Relacion < ActiveRecord::Base
validate :generica_o_museo
validates_presence_of :sentido_relacion
  belongs_to :museo_origen, :class_name => "Museo"
  belongs_to :museo_fin, :class_name => "Museo"
  belongs_to :generica_origen, :class_name => "Generica"
  belongs_to :generica_fin, :class_name => "Generica"
  belongs_to :sentido_relacion, :class_name => "SentidoRelacion"
  

  def nombre_extremo_fin
    if self.generica_fin.nil?
      return self.museo_fin.nombre
    else
      return self.generica_fin.titulo
    end
  end



  private

    def generica_o_museo
      if !(museo_fin.blank? ^ generica_fin.blank?)
        errors[:base]<< "Specify a charge or a payment, not both"
      end
    end

end
