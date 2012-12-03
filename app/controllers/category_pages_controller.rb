class CategoryPagesController < ApplicationController
  respond_to :json, :html

  def show
    @title = params[:title]
    @page = CategoryPage.new(@title)
    @context = {'title' => @page.title, 'categories' => @page.categories, 'sections' => @page.sections, 'backlinks' => @page.backlinks, 'members' => @page.members}
    respond_with @context
  end

end
