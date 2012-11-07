class PagesController < ApplicationController
  include PagesHelper
  respond_to :json, :html

  def show
    @title = params[:title]
    @page = Page.new(@title)
    @context = {'title' => @page.title, 'categories' => @page.categories}
    respond_with @context
  end	

  # get all sections for a page
  def sections
    title = params[:id]
    page = Page.new(title)
    sections = page.sections
    respond_with sections
  end

  def section
    title = params[:id]
    p = Page.new(title)
    section = {'content' => p.section(params[:title])}
    respond_with section.to_json
  end	
end	