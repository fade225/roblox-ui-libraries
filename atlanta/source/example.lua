--[[ A base example, check the source for more API ]]

local library, themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/fade225/roblox-ui-libraries/refs/heads/main/atlanta/source.lua"))()

local dim2 = UDim2.new
local hex = Color3.fromHex 

--[[ Creating a new window ]]
local window = library:window({name = os.date('Atlanta |  - %b %d %Y'),size = dim2(0, 750, 0, 782)})

--[[ Creating a new tab ]]
local tab = window:tab({name = "My tab"})
local tab2 = window:tab({name = "Visuals"})

--[[ Force open a tab ]]
tab.open_tab() 

--[[ Creating a new column ]]
local column = tab:column() 

--[[ Creating a multi section ]]
local multiSection, multiSection2 = column:multi_section({names = {"Section 1", "Section 2"}})

--[[ Creating a section ]]
local section = column:section({name = "Aimbot", toggle = false})

--[[ You create elements in whatever section you want. For example, if we want to use the multiSection we call multiSection:... instead of section:... ]]
--[[ Flags in elements are the flags used to save and load configs. They must be unique ]]
--[[ Creating a toggle ]]
local toggle = section:toggle({name = "Enabled", flag = "enabled_flag", tooltip = "This is a tooltip, it displays text when you hover over it."})

--[[ Creating a keybind ]]
--[[ Keybinds can be attached to toggles ]]
toggle:keybind({name = "Lock", flag = "keybind_flag"})

--[[ Creating a dropdown ]]
section:dropdown({name = "Hit part", flag = "dropdown_flag", items = {"Head", "HumanoidRootPart"}, default = "Head", tooltip = "..."})

--[[ Creating a slider ]]
section:slider({name = "Delay", min = 0, max = 1000, default = 40, interval = 1, suffix = "ms", flag = "slider_flag", tooltip = "..."})

--[[ Creating a colorpicker ]]
--[[ Colorpickers can be attached to toggles, multiple times ]]
section:toggle({name = "FOV color", flag = "color_flag"}):colorpicker({name = "Inline color", flag = "inline_color_flag", color = hex("#7D0DC3"), alpha = 0.5}):colorpicker({name = "Outline color", flag = "outline_color_flag", color = hex("#7D0DC3"), alpha = 0.5}) 

--[[ Esp preview example ]]
local esp;
local function update_elements() 
  if esp and esp.refresh_elements then 
    esp.refresh_elements() 
  end 
end 

local visuals_column = tab2:column()
local visuals_section = visuals_column:section({name = "General", toggle = false})

visuals_section:toggle({name = "Enabled", flag = "Enabled", callback = update_elements})
visuals_section:toggle({name = "Names", flag = "Names", callback = function() end}):colorpicker({flag = "Name_Color", callback = update_elements})

visuals_section:toggle({name = "Boxes", flag = "Boxes", callback = update_elements}):colorpicker({name = "Box Color", flag = "Box_Color", callback = update_elements})

visuals_section:dropdown({name = "Box Type", flag = "Box_Type", items = {"Corner", "Full"}, default = "Corner", callback = update_elements})

visuals_section:toggle({name = "Healthbar", flag = "Healthbar", callback = update_elements}):colorpicker({name = "High HP Color", flag = "Health_High", callback = update_elements}):colorpicker({name = "Low HP Color", flag = "Health_Low", callback = update_elements})
	
visuals_section:toggle({name = "Distance", flag = "Distance", callback = update_elements}):colorpicker({name = "Distance Color", flag = "Distance_Color", callback = update_elements})
visuals_section:toggle({name = "Weapon", flag = "Weapon", callback = update_elements}):colorpicker({name = "Weapon Color", flag = "Weapon_Color", callback = update_elements})

esp = window.esp_section:esp_preview({})


--[[ Init ]]
library:config_list_update()

for index, value in themes.preset do 
	pcall(function()
		library:update_theme(index, value)
	end)
end

task.wait()

library.old_config = library:get_config()
