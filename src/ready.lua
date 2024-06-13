---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.

local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/ShellText.en.sjson')


modutil.mod.Path.Wrap("SetupMap", function(base, ...)
	prefix_SetupMap()
	return base(...)
end)

if config.Enabled then

	local textfile = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')

	if config.FreeArcanas then

		OverwriteTableKeys(MetaUpgradeCardData.DoorReroll, {
			Cost = 0,
			AutoEquipRequirements = 
			{
				RequiredMetaUpgradesMin = 1,
			},
			AutoEquipText = "TradeOff_AutoEquip",
		})				
		
		OverwriteTableKeys(MetaUpgradeCardData.TradeOff, {
			AutoEquipRequirements = 
			{
				RequiredMetaUpgradesMin = 1,
			},
		})		
		
		OverwriteTableKeys(MetaUpgradeCardData.ScreenReroll, {
			Cost = 0,			
			AutoEquipRequirements = 
			{
				RequiredMetaUpgradesMin = 1,
			},
			AutoEquipText = "TradeOff_AutoEquip",
		})		

		sjson.hook(textfile, function(sjsonData)
			for _, v in ipairs(sjsonData.Texts) do
				if v.Id == "TradeOff_AutoEquip" then
					v.DisplayName = "{$Keywords.AutoEquip}: {#ItalicLightFormat}Activate any other card.{#Prev}."
				end
			end
		end)
		
	end

	if config.MoreRerolls then

		OverwriteTableKeys(TraitData.DoorRerollMetaUpgrade, {
			RerollCount = { BaseValue = config.RerollCount }
		})	

		OverwriteTableKeys(TraitData.RerollTradeOffMetaUpgrade, {
			RerollCount = { BaseValue = config.RerollCount }
		})

		OverwriteTableKeys(TraitData.PanelRerollMetaUpgrade, {
			RerollCount = { BaseValue = config.RerollCount }
		})
	end
end

game.OnControlPressed({'Gift', function()
	return trigger_Gift()
end})

