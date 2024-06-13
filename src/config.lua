local config = {
  Enabled = true,
  FreeArcanas = true,
  MoreRerolls = true,
  RerollCount = 9,
}

local desc = {
  Enabled = "True for enable mod, false for disable",
  FreeArcanas = "True for 0 grasp cost for every reroll card, false for default values",
  MoreRerolls = "True for custom base amount of rerolls for cards, false for default values",
  RerollCount = "Sets base value if MoreRerolls is enabled"
}

return config, desc