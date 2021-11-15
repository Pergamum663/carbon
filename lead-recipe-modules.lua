-- Enable prod modules for all lead plate and ore recipes

recipes = {"lead-plate"}
if mods["Krastorio2"] then
  table.insert(recipes, "enriched-lead-plate")
  table.insert(recipes, "enriched-lead")
end
if mods["space-exploration"] then
  table.insert(recipes, "lead-smelting-vulcanite")
  if mods["Krastorio2"] then
    table.insert(recipes, "enriched-lead-smelting-vulcanite")
  end
end

for i, recipe in pairs(recipes) do
  if data.raw.recipe[recipe] then
    for j, module in pairs(data.raw.module) do
      if module.effect then
        for effect_name, effect in pairs(module.effect) do
          if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
            table.insert(module.limitation, recipe)
          end
        end
      end
    end
  end
end
