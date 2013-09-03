require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://www.cnn.com"))
cnn = page.css('div.cnn_mtt1content ul.cnn_bulletbin a')

File.open('cnn.html', 'w') do |f|

	f.puts("<html")
	f.puts("<head>")
	f.puts("	<title>Intro to HTML/CSS</title>")
	f.puts("</head>")
	f.puts("<body>")
	f.puts(		"<h1>cnn sucks!!!</h1>")
	f.puts ("	<ul>")


cnn.each do |cnn|
		f.puts("		<li>" + cnn.text + "</li>")
	end


	f.puts("	<ul>") 
	f.puts("</body>\n")
	f.puts("</html>\n")

end