class PresentationsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @presentations = Presentation.all.order("created_at DESC, updated_at DESC")
  end
  
  def new
    @presentation = Presentation.new
  end
  
  def edit
    @presentation = Presentation.find_by_id_or_permalink(params[:id])
  end
  
  def show
    @presentation = Presentation.find_by_id_or_permalink(params[:id])
  end
  
  def create
    @presentation = current_user.presentations.build(presentation_params)
    begin
      respond_to do |format|
        if @presentation.save
          format.html { redirect_to edit_presentation_path(@presentation), :notice =>  'Presentation was successfully created.' }
  
        else
          format.html { render :action =>  "new" }
        end
      end
      
    rescue
      redirect_to new_moderator_topic_path
    end
    # respond_to do |format|
    # 
    #   if @presentation.save
    #     redirect_to edit_presentation_path(@presentation), :notice =>  'Presentation was successfully created.'
    #   else
    #     format.html { render :action =>  "new" }
    #   end
    # end
  end
  
  
  
  def update
    @presentation = Presentation.find_by_id_or_permalink(params[:id])
    
    respond_to do |format|
    
      if @presentation.update(presentation_params)
      
        format.html { redirect_to root_path, :notice =>  'Presentation was successfully updated.' }
      else
        format.html { render :action =>  "new" }
      end
    end
  end
  

  def destroy
    ppt = Presentation.find params[:id]
    ppt.destroy
    
    redirect_to presentations_path
  end
  
  # AJAX
  def ajax_like
    ppt = Presentation.find params[:id]
    current_user.toggle_like!(ppt)
    render json: { status: current_user.likes?(ppt), count: ppt.reload.likers_count }
  end
  
  private
  
  def presentation_params
    params.require(:presentation).permit(:title)
  end
end