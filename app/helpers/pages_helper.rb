module PagesHelper
  require 'wikicloth'
  require 'pygments.rb'
	def parse(page)
    content = highlight(page['content'])
    wiki = WikiCloth::Parser.new(:data => content)
    html = wiki.to_html
    html.gsub!('!START!', '<pre>')
    html.gsub!('!END!','</pre>')
    return html.html_safe
  end  

  def highlight(input)
    #s = input.index('<syntaxhighlight>')
    puts "FOO"
    puts substring_positions('<syntaxhighlight', input)
    fragments = []
    substring_positions('<syntaxhighlight', input).each do |idx|
      e = input.index('</syntaxhighlight>', idx + 1)
      puts "START: #{idx}; END: #{e}"
      fragment = input[idx, e + 18 - idx]
      fragments.push(fragment)
    end  

    fragments.each do |fragment|
      matches = fragment.match /<syntaxhighlight lang="(\w+)">([\S\s]+)<\/syntaxhighlight>/
      puts "FRAGMENT: #{fragment}"
      lang = matches[1]
      code = matches[2]
      highlighted = Pygments.highlight(code, :lexer => lang)
      highlighted.gsub!('<pre>', '!START!')
      highlighted.gsub!('</pre>', '!END!')
      input.gsub!(fragment, highlighted)
    end  
    
    input
  end  

  def substring_positions(substring, string)
    string.enum_for(:scan, substring).map { $~.offset(0)[0] }
  end
end
