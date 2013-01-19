require 'objspace'
require 'foo'

class AaronControllerController < ApplicationController
  
  def index
    @current_object = params[:id] ? ObjectSpace._id2ref(params[:id].to_i) : Foo::OBJECT
    @references = ObjectSpace.reachable_objects_from(@current_object)
    respond_to do |format|
    format.json do
      render :json => @references.map{ |r| r.object_id }
    end
    format.html 
    end
    
  end
  
end
