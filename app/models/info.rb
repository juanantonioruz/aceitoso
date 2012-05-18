class Info < ActiveRecord::Base

  belongs_to :museo
  belongs_to :generica

  acts_as_heir_of :relacionable

    
  def nombre_select
    "#{self.class}: #{titular(self)}"    
  end

  def nombre_relacionable
    titular(self)    
  end
  
  def descripcion
    if !generica.blank?
          "#{generica.descripcion}"
        else
           return "Sin articulo asociado. Id: #{id}"
      end
    end
  
     def nombre_ask
        "#{titular(self)}"
    end
   def titular(info)
     if !info.generica.blank?
          "#{info.generica.titulo}"
        else
           return "Sin articulo asociado. Id: #{info.id}"
      end
    end

end
