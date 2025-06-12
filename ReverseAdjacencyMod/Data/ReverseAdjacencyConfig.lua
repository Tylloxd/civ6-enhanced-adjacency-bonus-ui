-- =======================================================================
--  Reverse Adjacency Configuration for District Placement Enhancement
--  
--  ⚠️  IMPORTANT: This file contains MOCK DATA for demonstration purposes!
--  
--  This mod does NOT provide real reverse adjacency calculations.
--  It displays a mock "+9 Faith" bonus to demonstrate the UI framework.
--  
--  🔧 FOR DEVELOPERS: Replace the functions below with your actual 
--      reverse adjacency calculation logic to integrate with this 
--      working visual system.
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

-- 🔧 DEVELOPER INTEGRATION POINT #1: Replace this function with your algorithm
-- 
-- Get reverse adjacency bonus for any district placement
-- 
-- This function is called every time a district placement shows adjacency bonuses.
-- Replace the mock logic below with your actual reverse adjacency calculations.
--
-- Params:
--     districtType: The type of district being placed (number/hash)
--     pCity: The city object where the district is being placed  
--     kPlot: The plot object where the district is being placed
-- Return: 
--     bonusString: Formatted string for display (e.g., "[ICON_Faith][COLOR:ResFaithLabelCS]+9[ENDCOLOR]")
--     bonusTooltip: Tooltip text explaining the bonus (optional)
--
-- Example for multiple yields:
-- bonusString = "[ICON_Science]+2[ENDCOLOR], [ICON_Culture]+1[ENDCOLOR]"
function GetMockReverseAdjacencyBonus(districtType, pCity, kPlot)
    -- 🚨 MOCK DATA - REPLACE WITH YOUR CALCULATION LOGIC 🚨
    local bonusString = "[" .. MOCK_REVERSE_BONUS.Icon .. "]" ..
                       "[COLOR:" .. MOCK_REVERSE_BONUS.ColorStyle .. "]" ..
                       "+" .. tostring(MOCK_REVERSE_BONUS.Amount) ..
                       "[ENDCOLOR]";
    
    local bonusTooltip = "Mock reverse adjacency bonus: +" .. tostring(MOCK_REVERSE_BONUS.Amount) .. 
                        " Faith that this district would provide to existing districts.";
    
    return bonusString, bonusTooltip;
end

-- 🔧 DEVELOPER INTEGRATION POINT #2: Add conditional logic here
--
-- Check if reverse adjacency bonuses should be shown for this district placement
-- Add your own logic to control when reverse bonuses appear
--
-- Params:
--     districtType: The type of district being placed (number/hash)
--     pCity: The city object where the district is being placed
--     kPlot: The plot object where the district is being placed  
-- Return:
--     boolean: true if reverse bonuses should be displayed
function ShouldShowReverseAdjacencyBonus(districtType, pCity, kPlot)
    -- 🚨 MOCK LOGIC - REPLACE WITH YOUR CONDITIONS 🚨
    -- Current: Always show mock bonus for demonstration
    -- 
    -- Examples of conditions you might add:
    -- - Only show for certain district types
    -- - Only show if there are adjacent districts that would benefit  
    -- - Only show if the player has certain technologies/civics
    -- - Only show if the calculated bonus is > 0
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