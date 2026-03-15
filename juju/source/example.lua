--[[ For more in depth and detail docs, visit this link if it's still available: https://panduh.gitbook.io/panduh-docs ]]
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fade225/roblox-ui-libraries/refs/heads/main/juju/source/source.lua"))()

--[[ Creating a new window ]]
--[[ You dont need to call something, the window is created automatically. Use library["menu"] to access it ]]
local menu = library["menu"]

--[[ Creating a group ]]
local group = menu.create_group("Combat")

--[[ Creating a tab ]]
group:create_tab("example_tab")

--[[ Creating a section | (tabName, name, side [1 = left, 2 = right], size [Y size 0.1-1], offset [Y offset 0-0.9]) ]]
--[[ group:create_section will error if a tab is not created beforehand ]]
local section = group:create_section("example_tab", "example_section", 1, 1, 0)

--[[ Creating a panel/list | (tabName, name, side [1 = left, 2 = right], favorites, configs) ]]
local list = group:create_panel_section("example_tab", "options", 2, true, false)

--[[ Add item to panel / list ]]
list:add_item({["text"] = "a"})

--[[ Creating elements is different from other UI libraries ]]
--[[ Each element has different properties, every element is created with create_element ]]
--[[ Colorpicker example ]]
local cp_example = section:create_element({
    ["name"] = "colorpicker example"
}, {
    ["colorpicker"] = { -- <- Properties for this element
        ["color_flag"] = "example_color",
        ["default_color"] = Color3.fromRGB(0,255,0),
        ["transparency_flag"] = "example_transparency",
        ["default_transparency"] = 0
    }
})

--[[ Toggle example ]]
local t_example = section:create_element({
    ["name"] = "toggle example"
}, {
    ["toggle"] = {
        ["default"] = false,
        ["flag"] = "toggle_flag",
    }
})

--[[ Slider example ]]
local s_example = section:create_element({
    ["name"] = "slider example"
}, {
    ["slider"] = {
        ["min_text"] = "min", -- <- Text that shows when the slider is at MAX value
        ["max_text"] = "max", -- <- Text that shows when the slider is at MIN value
        ["decimals"] = 1,
        ["default"] = 67,
        ["prefix"] = "",
        ["suffix"] = "%",
        ["flag"] = "slider_flag",
        ["min"] = 0,
        ["max"] = 100,
    }
})

--[[ Dropdown example ]]
local d_example = section:create_element({
    ["name"] = "dropdown example"
}, {
    ["dropdown"] = {
        ["default"] = {"e1"},
        ["options"] = {"e1","e2"},
        ["requires_one"] = true, -- <- Can the selection be nothing
        ["multi"] = true,
        ["flag"] = "dropdown_flag",
    }
})

--[[ Button example ]]
local b_example = section:create_element({
    ["name"] = "button example"
}, {
    ["button"] = {
        ["confirmation"] = false, -- <- Double click
    }
})

--[[ Textbox example ]]
local tb_example = section:create_element({
    ["name"] = "textbox example"
}, {
    ["textbox"] = {
        ["default"] = "some text",
        ["flag"] = "textbox_flag", -- <- Double click
    }
})

--[[ Keybind example ]]
local kb_example = section:create_element({
    ["name"] = "keybind example"
}, {
    ["keybind"] = {
        ["flag"] = "keybind_flag",
        ["default"] = Enum["KeyCode"]["RightShift"]
    }
})

--[[ Element API ]]
-- [[ element:create_settings creates a fake section openable by the cog icon next to your element label. This fake section's create_element function has identical functionality to create_element, just without the section name arg ]]
t_example:create_settings()

--[[ Setting the visibility of an element ]]
t_example:set_visible(true)

--[[ Colorpicker API ]]
--[[ Detect color change ]]
library["create_connection"](cp_example["on_color_change"], function(col)
    print(tostring(col))
end)

--[[ Detect transparency change ]]
library["create_connection"](cp_example["on_transparency_change"], function(alpha)
    print(tostring(alpha))
end)

--[[ Set color ]]
cp_example:set_colorpicker(Color3.fromRGB(255,255,255))

--[[ Set transparency ]]
cp_example:set_colorpicker_transparency(.5)

--[[ Toggle API ]]
--[[ Detect toggle change ]]
library["create_connection"](t_example["on_toggle_change"], function(bool)
    print(bool)
end)

--[[ Set a toggle ]]
t_example:set_toggle(true)

--[[ Slider API ]]
--[[ Detect slider change ]]
library["create_connection"](s_example["on_slider_change"], function(num)
    print(tostring(num))
end)

--[[ Set a slider ]]
s_example:set_slider(41)

--[[ Dropdown API ]]
--[[ Detect dropdown change ]]
library["create_connection"](d_example["on_dropdown_change"], function(tbl)
    print(table.concat(tbl,","))
end)

--[[ Set a dropdown ]]
d_example:set_dropdown({"e2"})

--[[ Set a dropdown's options ]]
d_example:set_options({"new","new2"})

--[[ Button API ]]
--[[ Detect button click ]]
library["create_connection"](b_example["on_clicked"], function(tbl)
    print("click")
end)

--[[ Textbox API ]]
--[[ Detect textbox change ]]
library["create_connection"](tb_example["on_textbox_change"], function(txt)
    print(txt)
end)

--[[ Set textbox ]]
tb_example:set_textbox("hi")
