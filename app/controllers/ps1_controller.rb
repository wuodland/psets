class Ps1Controller < ApplicationController
  def index
  #@project = Project.all
  end

  def divide
   logger.error "About to divide by 0"
   5/0
  end


  def news
  require 'open-uri'
  require 'nokogiri' 
  proxy_uri = URI.parse("http://192.41.170.23:3128/")
  doc = Nokogiri::HTML(open("https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen", :proxy_http_basic_authentication => [proxy_uri, "", ""]))  
  @allitems = doc.css('.NiLAwe.gAl5If.jVwmLb.Oc0wGc.R7GTQ.keNKEd.j7vNaf.nID9nc')
  @hyplink = []
  @thumbs = []
  @title = []
 
  for obj in @allitems
      @hyplink.push(obj.css('.VDXfz'))
      @thumbs.push(obj.css('.tvs3Id.dIH98c'))
      @title.push(obj.css('h3').css('.ipQwMb.Q7tWef'))
  end
 
  var = Nokogiri::HTML(open("https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRFZxYUdjU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen", :proxy_http_basic_authentication => [proxy_uri, "", ""]))
          @tags = var.css('.NiLAwe.gAl5If.jVwmLb.Oc0wGc.R7GTQ.keNKEd.j7vNaf.nID9nc')
          @head_link = []
          @head_img = []
          @head_title = []
 
          for i in @tags
                   @head_link.push(i.css('.VDXfz'))
                   @head_img.push(i.css('.tvs3Id.dIH98c'))
                   @head_title.push(i.css('h3').css('.ipQwMb.Q7tWef'))

		

		end
end

end

  
  
   






