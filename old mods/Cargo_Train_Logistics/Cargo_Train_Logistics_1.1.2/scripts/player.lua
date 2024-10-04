local player_data = {}

player_data.metatable = {__index = player_data}

function player_data.new(player)
    local module = {
        player = player,
        index = tostring(player.index),
        location = {x = 5, y = 85 * player.display_scale}
    }

    setmetatable(module, player_data.metatable)

    return module
end

function player_data:gui(wagondata)
    self.wagon = wagondata.entity
    self.unit_number = wagondata.entity.unit_number

    local frame = self.player.gui.screen.add{type = "frame", name = "CARGO_LOCATION", direction = "vertical", style = "inner_frame_in_outer_frame"}
    frame.location = self.location
    local titleflow = frame.add{type = "flow", direction = "horizontal"}
    titleflow.add{type = "label", caption = {"Cargo.Title"}, style = "frame_title"}
    titleflow.add{type = "empty-widget", style = "cargodragwidget"}.drag_target = frame

    if wagondata.request then
        local pane_frame = frame.add{type = "frame", direction = "vertical", style = "inside_deep_frame"}
        local subheader = pane_frame.add{type = "frame", direction = "horizontal", style = "subheader_frame"}
        self.checkbox = subheader.add{type = "checkbox", name = "CARGO_CHECK01", state = wagondata.enabled, caption = {"Cargo.Checkbox"}, tooltip = {"Cargo.CheckboxTooltip"}}
        subheader.add{type = "empty-widget", style = "cargowidget"}

        if wagondata.entity.type == "cargo-wagon" then
            subheader.add{type = "button", name = "CARGO_CLICK01", caption = {"Cargo.ApplyFilters"}}
            subheader.add{type = "sprite-button", name = "CARGO_CLICK02", sprite = "utility/trash", style = "tool_button_red"}
        end

        local pane = pane_frame.add{type = "tabbed-pane", style = "cargopane"}
        local tabs = {
            pane.add{type = "tab", caption = {"Cargo.Request"}},
            pane.add{type = "tab", caption = {"Cargo.Blacklist"}}
        }
        local flows = {
            pane.add{type = "flow", direction = "vertical"},
            pane.add{type = "flow", direction = "vertical"}
        }

        pane.add_tab(tabs[1], flows[1])
        pane.add_tab(tabs[2], flows[2])

        self.request_flow = flows[1]
        self:request_tab(wagondata.request)
        self.blacklist_flow = flows[2]
        self:blacklist_tab(wagondata.blacklist)
    else
        frame.add{type = "button", name = "CARGO_CLICK03", caption = {"Cargo.AddWagon"}}
    end

    self.frame = frame
end

function player_data:request_tab(request)
    local flow = self.request_flow

    flow.clear()

    local header_request = flow.add{type = "frame", direction = "horizontal", style = "cargosubheader"}
    header_request.add{type = "label", caption = {"Cargo.RequestDescription"}, tooltip = {"Cargo.RequestTooltip"}, style = "subheader_caption_label"}
    header_request.add{type = "empty-widget", style = "cargowidget"}

    self.scrollpane_request = flow.add{type = "scroll-pane", direction = "vertical", style = "cargoscrollpane"}
    self.request_elems = {}
    self.request_textfields = {}
    self.request_sliders = {}

    for item, amount in pairs(request) do
        self:add_request(item, amount)
    end

    self:add_request("cargodummy", 0)
end

function player_data:add_request(item, amount)
    local flow = self.scrollpane_request.add{type = "flow", direction = "horizontal", style = "cargorequestblacklistflow"}

    self.request_elems[item] = flow.add{type = "choose-elem-button", name = "CARGO_CHOOSE01_" .. item, elem_type = "item", item = (item ~= "cargodummy" and item) or nil, style = "cargochooseelem28"}

    local textfield = flow.add{type = "textfield", name = "CARGO_CONFIRMED01_" .. item, text = "1", style = "slider_value_textfield"}
    textfield.numeric = true

    local slider = flow.add{type = "slider", name = "CARGO_SLIDER01_" .. item, minimum_value = 0, maximum_value = 100, value = 1, value_step = 10, style = "notched_slider"}

    flow.add{type = "sprite-button", name = "CARGO_CLICK04_" .. item, sprite = "utility/trash", style = "tool_button_red"}

    if item ~= "cargodummy" then
        local stack_size = game.item_prototypes[item].stack_size
        textfield.text = tostring(amount)
        slider.set_slider_minimum_maximum(0, stack_size * 10)
        slider.slider_value = amount
        slider.set_slider_value_step(stack_size)
    else
        textfield.enabled = false
        slider.enabled = false
    end

    self.request_textfields[item] = textfield
    self.request_sliders[item] = slider
end

function player_data:blacklist_tab(blacklist)
    local flow = self.blacklist_flow

    flow.clear()

    local header_blacklist = flow.add{type = "frame", direction = "horizontal", style = "cargosubheader"}
    header_blacklist.add{type = "label", caption = {"Cargo.BlacklistDescription"}, tooltip = {"Cargo.BlacklistTooltip"}, style = "subheader_caption_label"}
    header_blacklist.add{type = "empty-widget", style = "cargowidget"}

    self.scrollpane_blacklist = flow.add{type = "scroll-pane", direction = "vertical", style = "cargoscrollpane"}
    self.blacklist_elems = {}
    self.blacklist_textfields = {}
    self.blacklist_sliders = {}

    for item, amount in pairs(blacklist) do
        self:add_blacklist(item, amount)
    end

    self:add_blacklist("cargodummy", 0)
end

function player_data:add_blacklist(item, amount)
    local flow = self.scrollpane_blacklist.add{type = "flow", direction = "horizontal", style = "cargorequestblacklistflow"}

    self.blacklist_elems[item] = flow.add{type = "choose-elem-button", name = "CARGO_CHOOSE02_" .. item, elem_type = "item", item = (item ~= "cargodummy" and item) or nil, style = "cargochooseelem28"}

    local textfield = flow.add{type = "textfield", name = "CARGO_CONFIRMED02_" .. item, text = "1", style = "slider_value_textfield"}
    textfield.numeric = true

    local slider = flow.add{type = "slider", name = "CARGO_SLIDER02_" .. item, minimum_value = 0, maximum_value = 100, value = 1, value_step = 10, style = "notched_slider"}

    flow.add{type = "sprite-button", name = "CARGO_CLICK05_" .. item, sprite = "utility/trash", style = "tool_button_red"}

    if item ~= "cargodummy" then
        local stack_size = game.item_prototypes[item].stack_size
        textfield.text = tostring(amount)
        slider.set_slider_minimum_maximum(0, stack_size * 10)
        slider.slider_value = amount
        slider.set_slider_value_step(stack_size)
    else
        textfield.enabled = false
        slider.enabled = false
    end

    self.blacklist_textfields[item] = textfield
    self.blacklist_sliders[item] = slider
end

function player_data:clear()
    self.frame.destroy()
    self.frame = nil
    self.wagon = nil
    self.unit_number = nil
    self.checkbox = nil
    self.request_flow = nil
    self.scrollpane_request = nil
    self.request_elems = nil
    self.request_textfields = nil
    self.request_sliders = nil
    self.blacklist_flow = nil
    self.scrollpane_blacklist = nil
    self.blacklist_elems = nil
    self.blacklist_textfields = nil
    self.blacklist_sliders = nil
end

return player_data