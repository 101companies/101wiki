class PagesController < ApplicationController
  include PagesHelper
  respond_to :json, :html
 
  def show
  	@title = params[:title]
    @p = Page.new("101implementation#{@title}")
    @page = @p.data
    @context = {'title' => @page['title'], 'categories' => get_categories(@page)}
    respond_with @page 
  end	
end	