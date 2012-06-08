class ResumenController < ApplicationController
  layout 'resumen'
  def museo
            @museo=Museo.find(params[:id])

  end
end
