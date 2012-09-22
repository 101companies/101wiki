require 'json'
require 'pp'

class Page
  include HTTParty
  base_uri 'http://101companies.org'

  def initialize(title)
    @title = title
  end

  def query
     "action=query&prop=revisions&titles=?&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&format=json"
  end  

  def data
    resp = self.class.get("/api.php?action=query&prop=revisions&titles=#{@title}&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&format=json").parsed_response
    resp["query"]["pages"].each_key do |revision|
      rev       = resp["query"]["pages"][revision]
      pageId    = rev['pageid']
      ns        = rev['ns']
      title     = rev['title']
      user      = rev['revisions'][0]['user']
      timestamp = rev['revisions'][0]['timestamp']  
      markup    = rev['revisions'][0]['*']
      data = {"title" => title, "content" => markup}
      return data
    end 
  end  
end	