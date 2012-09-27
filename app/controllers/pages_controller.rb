class PagesController < ApplicationController
  include PagesHelper
  respond_to :json, :html

  def show
    title = params[:title]
    logger.info title
    @p = Page.new(title)
    @page = @p.data
    @context = {'title' => @page['title'], 'categories' => get_categories(@page)}
    respond_with @page 
  end	

  def section
    title = params[:title]
    p = Page.new("101implementation:hadoop").data
    section = {'section' => title, 'content' => get_section(p, title)}
    respond_with section.to_json
  end	
end	