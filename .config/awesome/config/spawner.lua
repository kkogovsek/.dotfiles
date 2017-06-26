local Spawner = {}

Spawner.spawn = function (command, class, tag, test)
	local test = test or "class"
	local callback
	callback = function(c)
	    if test == "class" then
	        if c.class == class then
	            awful.client.movetotag(tag, c)
	            client.disconnect_signal("manage", callback)
	        end
	    elseif test == "instance" then
	        if c.instance == class then
	            awful.client.movetotag(tag, c)
	            client.disconnect_signal("manage", callback)
	        end
	    elseif test == "name" then
	           if string.match(c.name, class) then
	               awful.client.movetotag(tag, c)
	            client.disconnect_signal("manage", callback)
	        end
	    end
	end
	client.connect_signal("manage", callback)
	awful.util.spawn(command)
end

Spawner.init = function() 
	Spawner.spawn("google-chrome-stable", "Chrome", screen[1].tags[1], "class")
	Spawner.spawn("slack", "Slack", screen[1].tags[8], "class")
	awful.util.spawn('nm-applet')
	awful.util.spawn('cbatticon')
end;

return Spawner