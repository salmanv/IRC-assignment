require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "SalmanBotv"
channel = "#bitbreaker"

greeting_prefix = "privmsg #bitbreaker :"
greetings = ["friend"]  #enter the greeting here 

convo_prefix = "privmsg #bitbreaker :"
convo = ["self"]

deal_prefix = "privmsg #bitbreaker :"
deal = ["over"]

done_prefix = "privmsg #bitbreaker :"
done = ["duncan"]


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
		response = "hi ms.legs"
		sleep(3)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
		
	end

	wasConvo = false
	convo.each do |x|
		wasConvo = true if msg.include? x
	end
	if msg.include? convo_prefix and wasConvo
		response = "my name is bot-tom.. whats yourrr name?"
		sleep(5)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
		
	end

	wasDeal = false
	deal.each do |x|
		wasDeal = true if msg.include? x
		
	end
	if msg.include? deal_prefix and wasDeal
		response = "hell yeah!! whats your number sexy?"
		sleep(3)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
	end

	wasDone = false
	done.each do |x|
		wasDone = true if msg.include? x
		
	end
	if msg.include? done_prefix and wasDone
		response = "ill be there in 5 mins!!! "
		sleep(2)
		irc_server.puts "PRIVMSG #{channel} :#{response}"
	end

	
end


