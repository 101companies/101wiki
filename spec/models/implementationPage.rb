require 'spec_helper'

describe ImplementationPage do
  it "should return a content for the implementation page" do
    @page = ImplementationPage.new("hadoop")
    content = @page.content()
  end
end  

  