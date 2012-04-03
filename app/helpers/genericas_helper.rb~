module GenericasHelper
    def genealogia(label)
           
              
         if label.label_id.nil?
            return link_to(label.nombre,label_path(label))
        else
            padre=Label.find(label.label_id)
                       
            return link_to(genealogia(padre),label_path(padre)) +' > '+ link_to(label.nombre,label_path(label))            
            
            
        end
    end
 
end
