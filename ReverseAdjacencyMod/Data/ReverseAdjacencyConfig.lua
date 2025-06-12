-- =======================================================================
--  Reverse Adjacency Configuration for District Placement Enhancement
--  This file contains mock data for demonstrating reverse adjacency bonuses
--  Replace this configuration with actual calculation logic as needed
-- =======================================================================

print("Loading ReverseAdjacencyConfig.lua");

-- =======================================================================
-- Mock Configuration for Reverse Adjacency Bonuses
-- =======================================================================

-- Universal mock bonus that all districts will provide to existing districts
local MOCK_REVERSE_BONUS = {
    YieldType = "YIELD_FAITH",
    Amount = 9,
    Icon = "ICON_Faith",
    ColorStyle = "ResFaithLabelCS"
};

-- =======================================================================
-- Public Functions
-- =======================================================================

-- Get the mock reverse adjacency bonus for any district placement
-- This is where you would integrate actual reverse adjacency calculation logic
--
-- Params:
--     districtType: The type of district being placed
--     pCity: The city where the district is being placed  
--     kPlot: The plot where the district is being placed
-- Return: 
--     bonusString: Formatted string for display (e.g., "[ICON_Faith][COLOR:ResFaithLabelCS]+9[ENDCOLOR]")
--     bonusTooltip: Tooltip text explaining the bonus (optional)
function GetMockReverseAdjacencyBonus(districtType, pCity, kPlot)
    local bonusString = "[" .. MOCK_REVERSE_BONUS.Icon .. "]" ..
                       "[COLOR:" .. MOCK_REVERSE_BONUS.ColorStyle .. "]" ..
                       "+" .. tostring(MOCK_REVERSE_BONUS.Amount) ..
                       "[ENDCOLOR]";
    
    local bonusTooltip = "Mock reverse adjacency bonus: +" .. tostring(MOCK_REVERSE_BONUS.Amount) .. 
                        " Faith that this district would provide to existing districts.";
    
    return bonusString, bonusTooltip;
end

-- Check if reverse adjacency bonuses should be shown for this district placement
-- You can add logic here to conditionally show/hide reverse bonuses
--
-- Params:
--     districtType: The type of district being placed
--     pCity: The city where the district is being placed
--     kPlot: The plot where the district is being placed  
-- Return:
--     boolean: true if reverse bonuses should be displayed
function ShouldShowReverseAdjacencyBonus(districtType, pCity, kPlot)
    -- For demonstration, always show the mock bonus
    -- You could add conditions here, such as:
    -- - Only show for certain district types
    -- - Only show if there are adjacent districts that would benefit
    -- - Only show if the player has certain technologies/civics
    return true;
end

-- =======================================================================
-- Configuration Access Functions
-- =======================================================================

-- Get the current mock bonus configuration
-- Useful for debugging or extending the system
function GetMockBonusConfig()
    return MOCK_REVERSE_BONUS;
end

-- Update the mock bonus configuration
-- Allows easy modification for testing different values
function SetMockBonusConfig(yieldType, amount, icon, colorStyle)
    MOCK_REVERSE_BONUS.YieldType = yieldType or MOCK_REVERSE_BONUS.YieldType;
    MOCK_REVERSE_BONUS.Amount = amount or MOCK_REVERSE_BONUS.Amount;
    MOCK_REVERSE_BONUS.Icon = icon or MOCK_REVERSE_BONUS.Icon;
    MOCK_REVERSE_BONUS.ColorStyle = colorStyle or MOCK_REVERSE_BONUS.ColorStyle;
end

print("ReverseAdjacencyConfig.lua loaded - Mock reverse adjacency system ready"); 