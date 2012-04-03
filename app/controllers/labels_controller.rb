class LabelsController < ApplicationController
    def index 
        if params[:label_id]
            @label=Label.find(params[:label_id])
            @labels=@label.labels
        else
          @labels=Label.all
        end    
    end
    
    def new
        @label=Label.new
    end
    def create
        @label=Label.create(params[:label])
        
        @label.save
        
        if !@label.label_id.nil?
            redirect_to label_path(@label.label_id)     
        else               
           redirect_to @label
        end        
        
    
    end
    def show
        @label=Label.find(params[:id])
    end
    def edit
        @label=Label.find(params[:id])
    end

    def update
        @label = Label.find(params[:id])

        respond_to do |format|
            if @label.update_attributes(params[:label])
                 format.html { redirect_to @label, :notice => 'Informacion actualizada'  }         
            else
                format.html { render :action => "edit"}
            end
        end
    end



    def destroy
        
       @label=Label.find(params[:id])
        if @label.label_id.nil? || params[:index]
            @label.destroy
            redirect_to labels_url
        else
            destino=@label.label_id  
            @label.label_id=nil
            @label.save
            redirect_to label_path(params[:label_id])
         end
   
  end
end
