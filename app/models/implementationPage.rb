class ImplementationPage
  def query
     "action=query&prop=revisions&titles=?&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&format=json"
  end   

  def title = ""

  def ImplementationPage(title)
    @title = title
  end  

  def content
    #wiki = ....
    #wiki.getContent(@query)
  end 
end   