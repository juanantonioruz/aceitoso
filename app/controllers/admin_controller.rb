class AdminController < ApplicationController

  def index
  end
  def no_compatible
      render :layout=> 'resumen'

  end
  def no_screen
      render :layout=> 'resumen'

  end
  def seleccionar
    gen=params[:search_class].constantize.find(params[:search])
        @res=[]
        @res<<gen
    logger.error "ayyy#{@res}"

        respond_to do |format|  
        format.js{ render  :template=>"/autocomplete_results/#{params[:template]}"}  
      end
  end
  def search
    logger.error "jolin...#{params[:term]}"
    logger.error "jolin...#{params[:template]}"
    templ="search"
    if(!params[:template].nil?) then templ=params[:template] end
    modelos=params[:modelos_de_busqueda].split("-")
    logger.error "jolin...#{modelos}"
    @relacionables=[]
    modelos.each do |v|
      condicion=dameCondition(v,params[:term])
      if(v=="SentidoRelacion")
      if params[:term].strip.empty?
        condicion=nil
        end
      @relacionables+=v.constantize.joins(:nombre_relacion).find(:all,:conditions =>condicion, :order=>dameOrder(v))
    else
      nueva=v.constantize.find(:all,:conditions =>condicion, :order=>dameOrder(v))
      @relacionables+=nueva
     # puts v.constantize.to_s+"----------"+condicion.to_s+"......"+nueva.count.to_s
      end
    end
        respond_to do |format|  
        format.js{ render  :template=>"/autocomplete_results/#{templ}"}  
      end
  end
  def dameCondition v, t
    if v=="Museo" || v=="Pieza" || v=="Hito" || v=="Camino"
     ["nombre LIKE ?", "%#{t}%"]
    elsif v=="Generica" 
     ['titulo LIKE ?', "%"+t+"%"]
    elsif v=="SentidoRelacion" 
     ['nombre1 LIKE ? or nombre2 LIKE ?', "%"+t+"%","%"+t+"%"]
     end
  end
  def dameOrder v
    if v=="Museo" || v=="Pieza" || v=="Hito" || v=="Camino"
      'nombre asc'
    elsif v=="Generica"  
      'titulo asc'
    elsif v=="SentidoRelacion"  
      'id asc'
    end
  end
  
end
