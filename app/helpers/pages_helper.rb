module PagesHelper
  require 'wikicloth'
	def parse(page)
    wiki = WikiCloth::Parser.new(:data => page['content'])
    html = wiki.to_html
    return html.html_safe
  end  
end
