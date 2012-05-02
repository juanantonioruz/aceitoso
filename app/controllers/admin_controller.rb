class AdminController < ApplicationController
  def index
  end
  def search
    logger.error "ayyy#{params[:search]}"
        respond_to do |format|  
        format.js  
      end
  end
  def biz
    logger.error "jolin...#{params[:term]}"
    @relacionables=Museo.find(:all,:conditions => ['nombre LIKE ?', "%#{params[:term]}%"], :order=>'nombre asc')
        respond_to do |format|  
        format.js  
      end
  end
end
