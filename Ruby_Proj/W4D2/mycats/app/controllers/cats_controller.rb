class CatsController < ApplicationController
    def new
        @cat = Cat.new
        render :new
    end
    
    def index
       @cats = Cat.all
       render :index
    end

    def show
        @cat = Cat.find(params[:id])
        if @cat
            render :show
        else
            redirect_to cats_url
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        if @cat
            render :edit
        else
            redirect_to cats_url
        end
    end

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end