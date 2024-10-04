local train_data = {}

train_data.metatable = {__index = train_data}

function train_data.new(train)
    local module = {
        train = train,
        id = tostring(train.id),
        wagons = {},
        storage_wagons = {},
        next_index = nil
    }

    for _, entity in pairs(train.cargo_wagons) do
        module.storage_wagons[tostring(entity.unit_number)] = {entity = entity, inventory = entity.get_inventory(defines.inventory.cargo_wagon)}
    end

    setmetatable(module, train_data.metatable)

    return module
end

function train_data:add_wagon(entity)
    self.wagons[tostring(entity.unit_number)] = {
        entity = entity,
        enabled = true,
        request = {{item = nil, amount = 0}},
        blacklist = {{item = nil, amount = 0}},
        request_items = {},
        blacklist_items = {},
        inventory = entity.get_inventory(defines.inventory.cargo_wagon)
    }
    self.storage_wagons[tostring(entity.unit_number)] = nil
end

function train_data:remove_wagon(entity)
    self.wagons[tostring(entity.unit_number)] = nil
    self.storage_wagons[tostring(entity.unit_number)] = {entity = entity, inventory = entity.get_inventory(defines.inventory.cargo_wagon)}
end

function train_data:update()
    local storage_wagons = self.storage_wagons

    if table_size(storage_wagons) > 0 then
        local index, wagon = next(self.wagons, self.next_index)

        if index then
            self.next_index = index
            local entity = wagon.entity

            if entity.valid and wagon.enabled then
                local inventory = wagon.inventory

                for _, request in pairs(wagon.request) do
                    local item = request.item

                    if item then
                        local amount = request.amount - inventory.get_item_count(item)

                        if amount > 0 then
                            local amount2 = amount

                            for _, storage_wagon in pairs(storage_wagons) do
                                if storage_wagon.entity.valid then
                                    if amount2 > 0 then
                                        amount2 = amount2 - storage_wagon.inventory.remove({name = item, count = amount2})
                                    else
                                        break
                                    end
                                end
                            end

                            local amount3 = amount - amount2

                            if amount3 > 0 then
                                inventory.insert({name = item, count = amount3})
                            end
                        end
                    end
                end

                for _, blacklist in pairs(wagon.blacklist) do
                    local item = blacklist.item

                    if item then
                        local amount = inventory.get_item_count(item) - blacklist.amount

                        if amount > 0 then
                            local amount2 = amount

                            for _, storage_wagon in pairs(storage_wagons) do
                                if storage_wagon.entity.valid then
                                    if amount2 > 0 then
                                        amount2 = amount2 - storage_wagon.inventory.insert({name = item, count = amount2})
                                    else
                                        break
                                    end
                                end
                            end

                            local amount3 = amount - amount2

                            if amount3 > 0 then
                                inventory.remove({name = item, count = amount3}) 
                            end
                        end
                    end
                end
            end
        else
            self.next_index = nil
        end
    end
end

function train_data:on_configuration_changed()
    self.update_trains = nil
    
    for _, wagon in pairs(self.wagons) do
        if wagon.entity.valid and not wagon.inventory then
            game.print(wagon.entity.unit_number)
            wagon.inventory = wagon.entity.get_inventory(defines.inventory.cargo_wagon)
        end
    end

    local storage_wagons = self.storage_wagons
    self.storage_wagons = {}

    for index, wagon in pairs(storage_wagons) do
        if not wagon.entity then
            self.storage_wagons[index] = {entity = wagon, inventory = wagon.get_inventory(defines.inventory.cargo_wagon)}
        end
    end
end

return train_data