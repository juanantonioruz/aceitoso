class AdminController < ApplicationController

  def index
  end
  def seleccionar
    gen=Generica.find(params[:search])
        @res=[]
        @res<<gen
    logger.error "ayyy#{@res}"

        respond_to do |format|  
        format.js{ render  :template=>"/autocomplete_results/#{params[:template]}"}  
      end
  end
  def search
    logger.error "jolin...#{params[:term]}"
    modelos=params[:modelos_de_busqueda].split("-")
    logger.error "jolin...#{modelos}"
    @relacionables=[]
    modelos.each do |v|
      @relacionables+=v.constantize.find(:all,:conditions =>dameCondition(v,params[:term]), :order=>dameOrder(v))
      
    end
        respond_to do |format|  
        format.js  
      end
  end
  def dameCondition v, t
    if v=="Museo" || v=="Pieza"
     ['nombre LIKE ?', "%#{t}%"]
    elsif v=="Generica"
     ['titulo LIKE ?', "%#{t}%"]
     end
  end
  def dameOrder v
    if v=="Museo" || v=="Pieza"
      'nombre asc'
    elsif v=="Generica"
      'titulo asc'
    end
  end
  
end
