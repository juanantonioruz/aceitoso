class ServicesController < ApplicationController
    
    before_filter :pide_login

    def index
        @services=Service.all
    end
    def new
        @service=Service.new
    end
    def create 
        @service=Service.create(params[:service])
        @service.save
        redirect_to @service
    end 
    def update 
        @service=Service.find(params[:id])
        @service.update_attributes(params[:service])
        redirect_to @service
    end 
    def show
        @service=Service.find(params[:id])
    end
    def edit
        @service=Service.find(params[:id])
    end
    def destroy
        @service=Service.find(params[:id])
        @service.destroy
        redirect_to services_path
    end
end
