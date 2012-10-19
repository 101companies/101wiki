# -*- encoding : utf-8 -*-

require 'spec_helper'
require 'pygments.rb'

class WikiParser < WikiCloth::Parser

    url_for do |page|
      "javascript:alert('You clicked on: #{page}');"
    end

    link_attributes_for do |page|
      { :href => url_for(page) }
    end

    template do |template|
      puts template
      "Hello {{{1}}}" if template == "hello"
    end

    external_link do |url,text|
      "<a href=\"#{url}\" target=\"_blank\" class=\"exlink\">#{text.blank? ? url : text}</a>"
    end

end

describe Page do
  it "should return a content for the implementation page" do
    page = Page.new("101implementation:hadoop")
    puts page
  end

  it "shoud have sections" do
    page = Page.new("101implementation:hadoop")
    page.sections.each do |s| 
      puts "#{s.id}"
    end  
  end  
end 
  