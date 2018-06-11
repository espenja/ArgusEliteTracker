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

function ArgusEliteTracker:PerformOnAllElites(func)
    for _, elite in pairs(ArgusEliteTracker.elitesById) do
        func(elite)
    end
end

function ArgusEliteTracker:GetUnitId(unitName)
    if not UnitExists(unitName) then return nil end
    local guid = UnitGUID(unitName)
    if guid:sub(1,8) ~= "Creature" then return nil end
    return tonumber(guid:sub(-17,-12))
end

function ArgusEliteTracker:GetCurrentBucketNumber()
    -- Base confirmed on when the daily quest reset, which is
    -- the same for all time zones within a WoW region
    -- Put them in a bucket. Math, can you even

    -- Offset the bucket by a minute to allow for drift and
    -- time dilation in the space-time continuum
    -- Mob despawned a minute after whole o' clock
    -- Flip it upside down with the -6 and abs it with -1

    local resetTime = GetQuestResetTime()
    local delay = 60
    local fourHours = 3600 * 4

    local bucket = floor((((resetTime + delay) / (fourHours)) -6) * -1)

    if(bucket < 0) then
        bucket = bucket + 6
    end

    return bucket
end

function GetConf()
    local resetTime = GetQuestResetTime()
    local delay = 60
    
    local serverTime = GetServerTime()
    local localTime = GetTime()
    local gameTimeHours, gameTimeMinutes = GetGameTime()
    local resetTime = GetQuestResetTime()
    local delay1 = 0
    local delay2 = 60
    local delay3 = 120
    local fourHours = 3600 * 4
    
    local function getBucket(delay)
       local result = floor((((resetTime+delay)/(fourHours))-6)*-1)
       
       if result < 0 then
          result = result + 6
       end
       
       return result
    end
    
    --print("----")
    --print("serverTime: " .. serverTime)
    --print("localTime: " .. localTime)
    --print("gameTime: " .. gameTimeHours, gameTimeMinutes)
    --print("reset time : " .. resetTime)
    --print("next reset in: " .. tostring(resetTime/3600) .. "hours")
    --print("delay 0 seconds:   " .. getBucket(delay1))
    --print("delay 60 seconds:  " .. getBucket(delay2))
    --print("delay 120 seconds: " .. getBucket(delay3))
end