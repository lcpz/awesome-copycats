---------------------------------------------------------------------------
-- @author Harvey Mittens
-- @copyright 2014 Harvey Mittens
-- @email teknocratdefunct@riseup.net
-- @release v3.5.5
---------------------------------------------------------------------------

local menu_gen = require("menubar.menu_gen")
local menu_utils = require("menubar.utils")
local pairs = pairs
local ipairs = ipairs
local table = table
local string = string
local next = next

module("menugen")

--Built in menubar should be checking local applications directory
menu_gen.all_menu_dirs = { '/usr/share/applications/', '/usr/local/share/applications/', '~/.local/share/applications' }

--Expecting an wm_name of awesome omits too many applications and tools
menu_utils.wm_name = ""

-- Use MenuBar Parsing Utils to build StartMenu for Awesome
-- @return awful.menu compliant menu items tree
function build_menu()
	local result = {}
	local menulist = menu_gen.generate()

	for k,v in pairs(menu_gen.all_categories) do
		table.insert(result, {k, {}, v["icon"] } )
	end
	
	for k, v in ipairs(menulist) do
		for _, cat in ipairs(result) do
			if cat[1] == v["category"] then
				table.insert( cat[2] , { v["name"], v["cmdline"], v["icon"] } )
				break
			end
		end
	end
	
	-- Cleanup Things a Bit
	for k,v in ipairs(result) do
		-- Remove Unused Categories
		if not next(v[2]) then
			table.remove(result, k)
		else
			--Sort entries Alphabetically (by Name)
			table.sort(v[2], function (a,b) return string.byte(a[1]) < string.byte(b[1]) end)
			-- Replace Catagory Name with nice name
			v[1] = menu_gen.all_categories[v[1]].name
		end
	end

	--Sort Categories Alphabetically Also
	table.sort(result, function(a,b) return string.byte(a[1]) < string.byte(b[1]) end)

	return result
end


