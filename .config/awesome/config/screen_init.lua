local ScreenInit = {}
local xrp = require('config/widgets/xrp')

ScreenInit.init = function()
  -- Create a wibox for each screen and add it
  -- @TAGLIST_BUTTON@
  local taglist_buttons = gears.table.join(
                      awful.button({ }, 1, function(t) t:view_only() end),
                      awful.button({ modkey }, 1, function(t)
                                                if client.focus then
                                                    client.focus:move_to_tag(t)
                                                end
                                            end),
                      awful.button({ }, 3, awful.tag.viewtoggle),
                      awful.button({ modkey }, 3, function(t)
                                                if client.focus then
                                                    client.focus:toggle_tag(t)
                                                end
                                            end),
                      awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                      awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                  )

  -- @TASKLIST_BUTTON@
  local tasklist_buttons = gears.table.join(
                       awful.button({ }, 1, function (c)
                                                if c == client.focus then
                                                    c.minimized = true
                                                else
                                                    -- Without this, the following
                                                    -- :isvisible() makes no sense
                                                    c.minimized = false
                                                    if not c:isvisible() and c.first_tag then
                                                        c.first_tag:view_only()
                                                    end
                                                    -- This will also un-minimize
                                                    -- the client, if needed
                                                    client.focus = c
                                                    c:raise()
                                                end
                                            end),
                       awful.button({ }, 3, client_menu_toggle_fn()),
                       awful.button({ }, 4, function ()
                                                awful.client.focus.byidx(1)
                                            end),
                       awful.button({ }, 5, function ()
                                                awful.client.focus.byidx(-1)
                                            end))

  -- @DOC_WALLPAPER@
  local function set_wallpaper(s)
      -- Wallpaper
      if beautiful.wallpaper then
          local wallpaper = beautiful.wallpaper
          -- If wallpaper is a function, call it with the screen
          if type(wallpaper) == "function" then
              wallpaper = wallpaper(s)
          end
          gears.wallpaper.maximized(wallpaper, s, true)
      end
  end

  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", set_wallpaper)

  -- @DOC_FOR_EACH_SCREEN@
  awful.screen.connect_for_each_screen(function(s)
      -- Wallpaper
      set_wallpaper(s)

      -- Each screen has its own tag table.
      awful.tag({
        "\u{f268}",
        "\u{f15c}", 
        "\u{f120}", 
        "\u{f120}",  
        "\u{f135}", 
        "\u{f233}", 
        "\u{f03e}", 
        "\u{f198}", 
        "\u{f025}" 
        }, s, awful.layout.layouts[1])

      -- Create a promptbox for each screen
      s.mypromptbox = awful.widget.prompt()
      -- Create an imagebox widget which will contains an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      s.mylayoutbox = awful.widget.layoutbox(s)
      s.mylayoutbox:buttons(gears.table.join(
                             awful.button({ }, 1, function () awful.layout.inc( 1) end),
                             awful.button({ }, 3, function () awful.layout.inc(-1) end),
                             awful.button({ }, 4, function () awful.layout.inc( 1) end),
                             awful.button({ }, 5, function () awful.layout.inc(-1) end)))
      -- Create a taglist widget
      s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

      -- Create a tasklist widget
      s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

      -- @DOC_WIBAR@
      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s })

      -- @DOC_SETUP_WIDGETS@
      -- Add widgets to the wibox
      s.mywibox:setup {
          layout = wibox.layout.align.horizontal,
          { -- Left widgets
              layout = wibox.layout.fixed.horizontal,
              mylauncher,
              s.mytaglist,
              s.mypromptbox,
          },
          s.mytasklist, -- Middle widget
          { -- Right widgets
              layout = wibox.layout.fixed.horizontal,
              mykeyboardlayout,
              wibox.widget.systray(),
              mytextclock,
              s.mylayoutbox,
          },
      }
  end)
  -- }}}
end

return ScreenInit
