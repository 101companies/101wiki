require 'spec_helper'

describe Page do
  it "should return a content for the implementation page" do
    @page = Page.new("101implementation:hadoop")
    @content = @page.content()
    puts @content
  end
end  

  