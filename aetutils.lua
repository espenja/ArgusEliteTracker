local aet = ArgusEliteTracker
local L = aet.L

-- Commander of Argus
 function ArgusEliteTracker:findCommanderOfArgusIds()
    local numberOfCriteria = GetAchievementNumCriteria(12078)
    local eliteCriteriaIds = {}
    
    for index = 1, numberOfCriteria, 1 do
        local eliteName, _, completed, _, _, _, _, assetId = GetAchievementCriteriaInfo(12078, index)
        aet.elitesById[assetId].coaId = index
    end
end

