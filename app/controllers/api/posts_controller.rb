class API::PostController < ApplicationController
  
  def create
    
  end
  
  private
  def create_params
    params.require(:post).permit(:caption, :user_id, picture_attributes: [ :image ]).delete_if { |k,v| v.nil? }
  end
  
end