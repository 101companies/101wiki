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
    @page = Page.new("101implementation:hadoop")
    @content = @page.data()
    #puts @content
  end


  it "should return the list of the sections" do
    p = Page.new("101implementation:hadoop")
    page = p.data()
    data = page['content']
    data.gsub!('{{101contributor|Ralf Lämmel|influencer}}', 'foo')
    data.gsub!('{{101contributor|David Saile|developer}}', 'bar')

    puts "Input: #{page['content']}"
    wiki = WikiCloth::Parser.new(:data => data, :noedit => true) 
    wiki.to_html

    puts "Sections: #{wiki.sections}" 
    puts "Internal Links: #{wiki.internal_links.size} [#{wiki.internal_links.join(",")}]"
    puts "External Links: #{wiki.external_links.size}"
    puts "References:     #{wiki.references.size}"
    puts "Categories:     #{wiki.categories.size} [#{wiki.categories.join(",")}]"
    puts "Languages:      #{wiki.languages.size} [#{wiki.languages.keys.join(",")}]"
  end	

  it "should handle basic markup" do
    data = "== Headline ==
foo

== Languages ==
bar"
    wiki = WikiCloth::Parser.new(:data => data, :noedit => true) 
    wiki.to_html
    puts "Data: #{data}"
    puts "Sections: #{wiki.sections()}" 
  end  
end 
  