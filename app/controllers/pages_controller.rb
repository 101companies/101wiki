class PagesController < ApplicationController
  respond_to :json, :html
 
  def show
  	@title = params[:title]
    @p = Page.new("101implementation#{@title}")
    @page = @p.data()
    respond_with @page 
  end	
end	