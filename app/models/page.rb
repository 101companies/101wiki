# -*- encoding : utf-8 -*-
require 'json'
require 'pp'
require 'media_wiki'
require 'wikicloth'

class Page
  include HTTParty

  def initialize(title)
    @title = title
    @base_uri = 'http://101companies.org/api.php'
    @content = gateway.get(title)
    @wiki = WikiCloth::Parser.new(:data => @content, :noedit => true)
    @html = @wiki.to_html
  end

  def html
    @html
  end

  def wiki
    @wiki
  end

  def title
    @title
  end

  def content
    @content
  end

  def update(content)
    @content = content
    gateway.edit(@title, content)
  end

  def sections
    puts "sections:"
    sec = []
    @wiki.sections.first.children.each { |s| sec.push({'title' => s.title, 'wikitext' => s.wikitext})  }
    return sec

    #res = @wiki.sections.first.children.to_a.map{|s| return {title=> s.title, content => s.wikitext}}
    #return res
  end

  def categories
    @wiki.categories
  end  

  def section(section)
    @wiki.sections.first.children.find { |s| s.title.downcase == section.downcase } 
  end  

  private
    def gateway
      return MediaWiki::Gateway.new(@base_uri)
   end
end	