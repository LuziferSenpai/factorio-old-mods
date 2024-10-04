local MODNAME = "__SenpaisOverhall__"

function Senpais_fun_sorter(sor4, sor1, sor2, sor3)
	data.raw[sor4][sor1].subgroup = sor2;
	data.raw[sor4][sor1].order = sor3;
end

function Senpais_fun_tech_recipe_remove(tech, recipa)
	for i, effect in pairs(data.raw.technology[tech].effects ) do
		if effect.recipe == recipa then table.remove(data.raw.technology[tech].effects, i) end
    end
end

function Senpais_fun_tech_recipe_add(tech, recipa)
  if data.raw.technology[tech] and data.raw.recipe[recipa] then
    local addit = true
    if not data.raw.technology[tech].effects then
      data.raw.technology[tech].effects = {}
    end
    for i, effect in pairs(data.raw.technology[tech].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipa then addit = false end
    end
    if addit then table.insert(data.raw.technology[tech].effects,{type = "unlock-recipe", recipe = recipa}) end
  end
end

function Senpais_fun_tech_prerequi_remove(tech, prerequi)
  if data.raw.technology[tech] then
    for i, prequi in pairs(data.raw.technology[tech].prerequisites) do
      if prequi == prerequi then
        table.remove(data.raw.technology[tech].prerequisites, i)
      end
    end
  end
end

function Senpais_fun_tech_prerequi_add(tech, prerequi)
  if data.raw.technology[tech] and data.raw.technology[prerequi] then
    local addit = true
    if not data.raw.technology[tech].prerequisites then
    	data.raw.technology[tech].prerequisites = {}
    end
    for i, check in pairs(data.raw.technology[tech].prerequisites) do
      if check == prerequi then addit = false end
    end
    if addit then table.insert(data.raw.technology[tech].prerequisites, prerequi) end
  end
end

function Senpais_fun_item_type(name)
  local item_types = {"ammo", "armor", "capsule", "fluid", "gun", "item", "mining-tool", "module", "tool"}
  local item_type = nil
  for i, type_name in pairs(item_types) do
    if data.raw[type_name][name] then item_type = type_name end
  end
  return item_type
end

function Senpais_fun_item_basic_type(name)
  local item_type = "item"
  if data.raw.fluid[name] then item_type = "fluid" end
  return item_type
end


function Senpais_fun_item_basic(inputs)
  local item = {}
  if inputs.name then
    item.name = inputs.name
  else
    item.name = inputs[1]
  end

  if inputs.amount then
    item.amount = inputs.amount
  else
    if inputs[2] then
      item.amount = inputs[2]
    end
  end
  if not item.amount then
    item.amount = 1
  end

  if inputs.type then
    item.type = inputs.type
  else
    item.type = Senpais_fun_item_basic_type(item.name)
  end

  return item
end

function Senpais_fun_item_item(inputs)
  local item = {}
  if inputs.name then
    item.name = inputs.name
  else
    item.name = inputs[1]
  end
  if inputs.amount then
    item.amount = inputs.amount
  else
    if inputs[2] then
      item.amount = inputs[2]
    end
  end
  if not item.amount then
    if inputs.amount_min and inputs.amount_max then
      item.amount_min = inputs.amount_min
      item.amount_max = inputs.amount_max
    else
      item.amount = 1
    end
  end
  if inputs.probability then item.probability = inputs.probability end

  if inputs.type then
    item.type = inputs.type
  else
    item.type = Senpais_fun_item_basic_type(item.name)
  end
  return item
end

function Senpais_fun_item_combine(item1_in, item2_in)
  local item = {}
  local item1 = Senpais_fun_item_item(item1_in)
  local item2 = Senpais_fun_item_item(item2_in)
  item.name = item1.name
  item.type = item1.type
  if item1.amount and item2.amount then
    item.amount = item1.amount + item2.amount
  elseif item1.amount_min and item1.amount_max and item2.amount_min and item2.amount_max then
    item.amount_min = item1.amount_min + item2.amount_min
    item.amount_max = item1.amount_max + item2.amount_max
  else
    if item1.amount_min and item1.amount_max and item2.amount then
      item.amount_min = item1.amount_min + item2.amount
      item.amount_max = item1.amount_max + item2.amount
    elseif item1.amount and item2.amount_min and item2.amount_max then
      item.amount_min = item1.amount + item2.amount_min
      item.amount_max = item1.amount + item2.amount_max
    end
  end
  if item1.probability and item2.probability then
    item.probability = (item1.probability + item2.probability) / 2
  elseif item1.probability then
    item.probability = (item1.probability + 1) / 2
  elseif item2.probability then
    item.probability = (item2.probability + 1) / 2
  end
  return item
end

function Senpais_fun_replace_ingredient(recipa, old, new)
  if data.raw.recipe[recipa] and Senpais_fun_item_type(new) then
    local amount = 0
    for a, ingredient in pairs(data.raw.recipe[recipa].ingredients) do
      if ingredient[1] == old then
        amount = ingredient[2] + amount
      end
      if ingredient.name == old then
        amount = ingredient.amount + amount
      end
    end
    if amount > 0 then
      if data.raw.recipe[recipa] then
        for b, object in ipairs(data.raw.recipe[recipa].ingredients) do
          if object[1] == old or object.name == old then
            table.remove(data.raw.recipe[recipa].ingredients, b)
          end
        end
      end
      if data.raw.recipe[recipa] and Senpais_fun_item_type(Senpais_fun_item_basic({new, amount}).name) then
        local item = Senpais_fun_item_item({new, amount})
        local addit = true
        for c, objectj in pairs(data.raw.recipe[recipa].ingredients) do
          if objectj[1] == item.name or objectj.name == item.name then
            addit = false
            object = Senpais_fun_item.combine(objectj, item)
          end
        end
        if addit then 
          table.insert(data.raw.recipe[recipa].ingredients, item)
          if item.type == "fluid" then
            if data.raw.recipe[recipa].category == "chemistry" then
            else
              data.raw.recipe[recipa].category = "crafting-with-fluid"
            end
          end
        end
      end
    end
  end
end

function Senpais_fun_replace_all(old, new)
  if Senpais_fun_item_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      Senpais_fun_replace_ingredient(recipe.name, old, new)
    end
  end
end

function Senpais_fun_item_add(namef, sg, od, ss)
  return
  {
   type = "item",
   name = namef,
   icon = MODNAME.."/graphics/icons/"..namef..".png",
   flags = {"goes-to-quickbar"},
   subgroup = sg,
   order = od,
   stack_size = ss,
   place_result = namef
  }
end

function Senpais_fun_item_add2(namef, sg, od, ss)
  return
  {
   type = "item",
   name = namef,
   icon = MODNAME.."/graphics/icons/"..namef..".png",
   flags = {"goes-to-main-inventory"},
   subgroup = sg,
   order = od,
   stack_size = ss,
  }
end

function Senpais_fun_create_followerrobotcount(level, pack1, pack2, pack3, alienpack, count, addition)
  local result =
  {
    type = "technology",
    name = "follower-robot-count-1",
    icon = "__base__/graphics/technology/follower-robots.png",
    effects = { { type = "maximum-following-robots-count", modifier = addition } },
    prerequisites = { "combat-robotics" },
    unit = { ingredients = {}, time = 30 },
    upgrade = true,
    order = "e-p-b-c"
  }
  result.name = "follower-robot-count-" .. level
  result.prerequisites = {"follower-robot-count-" .. (level - 1)}
  result.unit.count = count
  if pack1 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-1", pack1})
  end
  if pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-2", pack2})
  end
  if pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-3", pack3})
  end
  if alienpack ~= 0 then
    table.insert(result.unit.ingredients, {"alien-science-pack", alienpack})
  end
  return result
end