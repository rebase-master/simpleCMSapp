class SectionsController < ApplicationController

    layout "admin"

    def index
      @sections = Section.sorted
    end

    def show
      @section = Section.find(params[:id])
    end

    def new
      @section = Section.new
      @pages = Page.sorted
      @section_count = Section.count + 1
    end

    def create
      #Instantiate the Section
      section = Section.new(section_params)
      if section.save
        #handle success
        flash[:notice] = "Section created successfully."
        redirect_to(:action => 'show', :id => section.id)
      else
        #handle failure
        @pages = Page.sorted
        @section_count = Section.count + 1
        flash[:error] = "An error occurred."
        render('new')
      end
    end

    def edit
      @section = Section.find(params[:id])
      @pages = Page.sorted
      @section_count = Section.count
    end

    def update
      #Find the Section in the database based on the parameter id
      @section = Section.find(params[:id])

      if @section.update_attributes(section_params)
        #handle success
        flash[:notice] = "Section updated successfully."
        redirect_to(:action => 'show', :id => @section.id)
      else
        #handle failure
        @pages = Page.sorted
        @section_count = Section.count
        flash[:error] = "An error occurred."
        render('edit')
      end
    end

    def delete
      @section = Section.find(params[:id])
    end

    def destroy
      section = Section.find(params[:id]).destroy
      flash[:notice] = "Section '#{section.name}' deleted successfully."
      redirect_to(:action => 'index')
    end

    private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible,
                                       :content_type, :content)
    end

  end
