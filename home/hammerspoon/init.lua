mash = {"⌘", "⌥", "⌃"}
cmd = {"cmd"}

require "apps"
require "grid"

-- hhtwm = require('hhtwm')
-- hhtwm.start()

-- hs.hotkey.bind(cmd, '.', hs.hints.windowHints)

-- local laptopScreen = "Built-in Retina Display"
-- local windowLayout = { 
--    { "Google Chrome", nil, laptopScreen, hs.layout.left50, nil, nil},
--    { "iTerm2", nil, laptopScreen, hs.layout.right50, nil, nil},
-- }
-- hs.layout.apply(windowLayout)


---------------------
--  Reload config  --
---------------------

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

hs.pathwatcher.new(os.getenv("HOME") ..
    "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")



