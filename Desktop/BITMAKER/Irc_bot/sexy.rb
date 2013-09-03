require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Sexy_legs"
channel = "#bitbreaker"

greeting_prefix = "privmsg #bitbreaker :"
greetings = ["hi"]  #enter the greeting here 

convo_prefix = "privmsg #bitbreaker :"
convo = ["name"]

ender_prefix = "privmsg #bitbreaker :"
ender = ["sexy"]



irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHellloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irce_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

#Hello, Bot!
until irc_server.eof? do 
	msg = irc_server.gets.downcase
	puts msg

	wasGreeted = false
	greetings.each do |g| 
	wasGreeted = true if msg.include? g

end

	if msg.include? greeting_prefix and wasGreeted
		response= "lol. hi there! tell me about your self"
		sleep(5)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
		
	end

	wasConvo = false
	convo.each do |x|
		wasConvo = true if msg.include? x
	end
	if msg.include? convo_prefix and wasConvo
		response = "thats a nice name! forget about me..are you down to come over??"
		sleep(5)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
		
	end

	wasEnder = false 
	ender.each do |x|
		wasEnder = true if msg.include? x 
	end
	if  msg.include? ender_prefix and wasEnder
		response = "so my number is 416-967-1111.. and im at 11 duncan st.. hurry up!"
		sleep(8)
		irc_server.puts "PRIVMSG #{channel} :#{response}"

	end
end


