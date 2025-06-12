-- =======================================================================
-- District Reverse Adjacency Enhancement
-- Replaces DistrictPlotIconManager.lua to add reverse adjacency bonus
-- Based on the proven pattern from Detailed Map Tacks mod
-- =======================================================================

print("Loading DistrictPlotIconManager_ReverseAdjacency.lua");

-- =======================================================================
-- Import base files
-- =======================================================================

-- Try to load the original DistrictPlotIconManager.lua
-- This follows the DMT pattern of including the base game file
local files = {
    "DistrictPlotIconManager.lua",
};

for _, file in ipairs(files) do
    include(file)
    -- Check if required functions are available after include
    if GetAdjacentYieldBonusString and Realize2dArtForDistrictPlacement then
        print("ReverseAdjacencyMod: Successfully loaded " .. file .. " as base file");
        break;
    end
end

-- Include our configuration
include("ReverseAdjacencyConfig");

-- =======================================================================
-- Cache original functions before overriding
-- =======================================================================

-- Store reference to the original adjacency bonus function
BASE_GetAdjacentYieldBonusString = GetAdjacentYieldBonusString;

-- =======================================================================
-- Enhanced Functions
-- =======================================================================

-- 🎯 MAIN INTEGRATION POINT: This function hooks into the game's district placement system
-- 
-- Override GetAdjacentYieldBonusString to include reverse adjacency bonuses
-- This is automatically called by the district placement system to get yield bonus text
-- 
-- 📋 DEVELOPER NOTE: You don't need to modify this function - it automatically calls
--    your functions in ReverseAdjacencyConfig.lua to get the actual bonus data
--
-- Params:
--     districtType: The district type index or hash
--     pCity: The city object
--     kPlot: The plot object where the district would be placed
-- Return:
--     yieldBonus: Enhanced yield bonus string with reverse adjacency data
--     yieldTooltip: Enhanced tooltip with reverse adjacency information  
--     requirementText: Requirement text (unchanged)
function GetAdjacentYieldBonusString(districtType, pCity, kPlot)
    -- First get the original adjacency bonus information
    local yieldBonus, yieldTooltip, requirementText = BASE_GetAdjacentYieldBonusString(districtType, pCity, kPlot);
    
    -- Check if we should show reverse adjacency bonuses
    if ShouldShowReverseAdjacencyBonus and ShouldShowReverseAdjacencyBonus(districtType, pCity, kPlot) then
        
        -- Get our mock reverse adjacency bonus
        local reverseBonus, reverseTooltip = GetMockReverseAdjacencyBonus(districtType, pCity, kPlot);
        
        if reverseBonus and reverseBonus ~= "" then
            -- Combine original bonus with reverse bonus
            if yieldBonus and yieldBonus ~= "" then
                -- Both original and reverse bonuses exist - combine with comma
                yieldBonus = yieldBonus .. ", " .. reverseBonus;
            else
                -- Only reverse bonus exists
                yieldBonus = reverseBonus;
            end
            
            -- Enhance tooltip if we have both
            if yieldTooltip and reverseTooltip then
                yieldTooltip = yieldTooltip .. "[NEWLINE][NEWLINE]" .. reverseTooltip;
            elseif reverseTooltip then
                yieldTooltip = reverseTooltip;
            end
        end
    end
    
    return yieldBonus, yieldTooltip, requirementText;
end

-- =======================================================================
-- Debug Functions (Optional)
-- =======================================================================

-- Debug function to log adjacency bonus calls
-- Uncomment the following lines for debugging district placement
--[[
function LogDistrictPlacement(districtType, pCity, kPlot, yieldBonus)
    if pCity and kPlot then
        local cityName = pCity:GetName();
        local plotX, plotY = kPlot:GetX(), kPlot:GetY();
        local districtName = districtType and GameInfo.Districts[districtType] and GameInfo.Districts[districtType].Name or "Unknown";
        print(string.format("ReverseAdjacencyMod: District %s placed at (%d,%d) in %s - Bonus: %s", 
              districtName, plotX, plotY, cityName, yieldBonus or "None"));
    end
end
--]]

-- =======================================================================
-- Initialization
-- =======================================================================

-- Verify that our configuration loaded correctly
if GetMockReverseAdjacencyBonus then
    print("ReverseAdjacencyMod: Configuration loaded successfully");
    
    -- Test the configuration
    local testBonus, testTooltip = GetMockReverseAdjacencyBonus(nil, nil, nil);
    print("ReverseAdjacencyMod: Test bonus string - " .. (testBonus or "ERROR"));
else
    print("ReverseAdjacencyMod: ERROR - Configuration failed to load");
end

print("ReverseAdjacencyMod: District placement enhancement ready"); 