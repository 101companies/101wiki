class PagesController < ApplicationController
  respond_to :json
  before_filter :default_format_json

  def default_format_json
    request.format = "json" unless params[:format]
  end
 
  def show
  	@name = params[:page]
  	puts @name
    @page = Page.new("101implementation#{@name}")
    @content = @page.content()
    respond_with @content.to_json   
  end	
end	