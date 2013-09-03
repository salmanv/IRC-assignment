require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://toronto.kijiji.ca/f-downtown-toronto-real-estate-short-term-rentals-W0QQCatIdZ42QQKeywordZdowntownQ20toronto"))
kijij = page.css('td.srchrht div#sbResultsListing div.sbInnerDiv table#SNB_Results.tblClpsePad tr td')

File.open('kijij.html', 'w') do |f|

	f.puts("<html")
	f.puts("<head>")
	f.puts("	<title>Intro to HTML/CSS</title>")
	f.puts("</head>")
	f.puts("<body>")
	f.puts(		"<h1>kijij Downtown shortterm rentals!</h1>")
	f.puts ("	<li>")


	kijij.each do |kijij|
		f.puts("		<li>" + kijij.text + "</li>")
	end


	f.puts("	<li>") 
	f.puts("</body>\n")
	f.puts("</html>\n")

end