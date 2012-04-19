class Info < ActiveRecord::Base

  belongs_to :museo

    
  def nombre_select
    "#{self.class}: #{titular(self)}"    
  end

  def nombre_relacionable
    titular(self)    
  end
  
   def titular(info)
     if !info.url.blank?
       "ee"
        else
           return "Sin articulo asociado. Id: #{info.id}"
      end
    end

end
