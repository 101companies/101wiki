require 'spec_helper'
require 'pygments.rb'

describe Page do
  it "should return a content for the implementation page" do
    @page = Page.new("101implementation:hadoop")
    @content = @page.data()
    #puts @content
  end
end 
  