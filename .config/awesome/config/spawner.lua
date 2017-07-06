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
	awful.util.spawn('nm-applet')
	awful.util.spawn('cbatticon')
end;

return Spawner
