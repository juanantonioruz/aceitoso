class Info < ActiveRecord::Base

  belongs_to :museo
    acts_as_heir_of :relacionable
  def nombre_select
    "#{self.class}: #{titular(self)}"    
  end

  def nombre_relacionable
    titular(self)    
  end
  
   def titular(info)
     if !info.url.blank?
       generica=Generica.find(info.url)    
        return generica.titulo
        else
           return "Sin articulo asociado. Id: #{info.id}"
      end
    end

end
