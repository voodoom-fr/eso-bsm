BSM = {}

BSM.name = "BattlegroundScoreMover"

function BSM:Initialize()
    self.inCombat = IsUnitInCombat("player")
    EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE, self.OnPlayerCombatState)
end

function BSM.OnAddonLoaded(event, addonName)
    if addonName == BSM.name then
        BSM:Initialize()
    end
end

function BSM.OnPlayerCombatState(event, inCombat)
    if inCombat ~= BSM.inCombat then
        BSM.inCombat = inCombat

        if inCombat then
            d("Entering combat.")
        else
            d("Exiting combat.")
        end

    end
end

EVENT_MANAGER:RegisterForEvent(BSM.name, EVENT_ADDON_ON_LOADED, BSM.OnAddonLoaded)