require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://www.newsnow.co.uk/h/Sport/Football/Premier+League/Chelsea"))
newsnow = page.css('div.lyt_wrap div.lyt_cwrap a')

File.open('newsnow.html', 'w') do |f|

	f.puts("<html")
	f.puts("<head>")
	f.puts("	<title>Intro to HTML/CSS</title>")
	f.puts("<link rel=\"stylesheet\" type=\"text/css\" href=\"newsstyle.css\">")
	f.puts("</head>")
	f.puts(		"<h1>Chelsea FC. <font color=red> BREAKING </font>News</h1>")
	f.puts(		"<h3>What you missed!</h3>")
	f.puts("<body>")
	f.puts ("	<ul>")


	newsnow.each do |newsnow|
		#f.puts newsnow.attributes.inspect
			#f.puts newsnow.attributes["href"]
		 if newsnow.attributes["href"].to_s.start_with?("/A")
			link = "<a href=http://www.newsnow.co.uk" + newsnow.attributes["href"] + ">" + newsnow.text + "</a>"
			f.puts("		<ul>" + link + "</ul>")
		end


	end


	f.puts("	</ul>") 
	f.puts("</body>\n")
	f.puts("</html>\n")

end

