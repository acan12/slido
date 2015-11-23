class PresentationsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @presentations = Presentation.all.order("created_at DESC, updated_at DESC")
  end
  
  def create
    @presentation = current_user.presentations.build(presentation_params)
    
    respond_to do |format|
    
      if @presentation.save
      
        format.html { redirect_to edit_presentation_path(@presentation), :notice =>  'Presentation was successfully created.' }
      else
        format.html { render :action =>  "new" }
      end
    end
  end
  
  def update
    @presentation = Presentation.find(params[:id])
    
    respond_to do |format|
    
      if @presentation.update(presentation_params)
      
        format.html { redirect_to root_path, :notice =>  'Presentation was successfully updated.' }
      else
        format.html { render :action =>  "new" }
      end
    end
  end
  
  def new
    @presentation = Presentation.new
  end
  
  def edit
    @presentation = Presentation.find(params[:id])
  end
  
  
  private
  
  def presentation_params
    params.require(:presentation).permit(:title)
  end
end