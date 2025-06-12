# Civilization VI Enhanced Adjacency Bonus UI

A Civilization VI mod that enhances the district placement interface by displaying reverse adjacency bonuses - showing the benefits that the new district would provide to existing districts in your city.

## ⚠️ **IMPORTANT: This mod uses MOCK DATA for demonstration purposes**

**This mod does NOT provide real reverse adjacency calculations.** It displays a mock "+9 Faith" bonus to demonstrate the UI enhancement technique. This is a **proof-of-concept framework** designed for developers who want to integrate actual reverse adjacency calculation logic.

## 🎯 What This Mod Does

When placing a district in Civilization VI, the game normally shows you the adjacency bonuses that the new district would receive from surrounding tiles. This mod **adds** a visual framework for displaying reverse adjacency bonuses - the benefits your new district would provide to existing districts.

### Before vs After (Mock Data Example)
- **Before**: See only "+2 Gold from River" when placing a Commercial Hub
- **After**: See "+2 Gold from River, +9 Faith" - demonstrating where reverse bonus would appear

## ✨ Features

- **Seamless Integration**: Uses the existing adjacency bonus display system
- **Native Styling**: Matches the game's visual style perfectly
- **All Districts**: Works with every district type
- **Edge Case Handling**: Functions whether or not base adjacency bonuses exist
- **Tooltip Support**: Enhanced tooltips with detailed information
- **Mock Data Framework**: Demonstrates +9 Faith bonus (easily replaceable with real calculations)
- **Developer-Ready**: Clear integration points for actual reverse adjacency algorithms

## 🚀 Installation

1. **Download**: Clone or download this repository
2. **Install**: Copy the `ReverseAdjacencyMod` folder to your Civilization VI mods directory:
   - **Windows**: `Documents\My Games\Sid Meier's Civilization VI\Mods\`
   - **Mac**: `~/Library/Application Support/Sid Meier's Civilization VI/Mods/`
   - **Linux**: `~/.local/share/aspyr-media/Sid Meier's Civilization VI/Mods/`
3. **Enable**: Launch Civilization VI and enable the mod in Additional Content
4. **Play**: Start a new game and try placing districts!

## 🔧 How It Works

### Technical Implementation
- **File Replacement**: Uses `ReplaceUIScript` to replace `DistrictPlotIconManager.lua`
- **Function Hooking**: Intercepts `GetAdjacentYieldBonusString` function
- **Bonus Injection**: Appends reverse adjacency data to existing bonus display
- **Format**: Uses native game formatting: `[ICON_Faith][COLOR:ResFaithLabelCS]+9[ENDCOLOR]`

### Code Structure
```
ReverseAdjacencyMod/
├── ReverseAdjacencyMod.modinfo                           # Mod metadata
├── Data/
│   └── ReverseAdjacencyConfig.lua                        # Mock bonus configuration
└── UI/
    └── DistrictPlotIconManager_ReverseAdjacency.lua      # Main implementation
```

## 🛠️ Customization

The mock bonus can be easily customized in `Data/ReverseAdjacencyConfig.lua`:

```lua
local MOCK_REVERSE_BONUS = {
    YieldType = "YIELD_FAITH",    -- Change yield type
    Amount = 9,                   -- Change bonus amount
    Icon = "ICON_Faith",          -- Change display icon
    ColorStyle = "ResFaithLabelCS" -- Change text color
};
```

## 🔬 Development Process

This project demonstrates a systematic approach to Civilization VI modding:

1. **Research Phase**: Analyzed successful existing mods for proven patterns
2. **Discovery Phase**: Found actual game systems through file analysis  
3. **Implementation Phase**: Built solution using established techniques
4. **Testing Phase**: Validated functionality in-game
5. **Documentation Phase**: Created comprehensive documentation

See the `/tasks/` folder for detailed development documentation.

## 📚 Documentation

- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Complete project overview and achievements
- **[Development Tasks](tasks/)** - Detailed task tracking and implementation process
- **[Modding Knowledge Base](CIV6_MODDING_KNOWLEDGE_BASE.md)** - General Civ 6 modding reference
- **[AI Instructions](AI_INSTRUCTIONS.md)** - Development guidelines used during creation

## 🔧 Developer Integration Guide

**For developers with actual reverse adjacency algorithms:** This mod provides a complete visual framework. Here's exactly how to integrate your calculations:

### Step 1: Replace the Mock Function
In `Data/ReverseAdjacencyConfig.lua`, replace the `GetMockReverseAdjacencyBonus()` function:

```lua
function GetMockReverseAdjacencyBonus(districtType, pCity, kPlot)
    -- REPLACE THIS SECTION WITH YOUR ALGORITHM
    -- You have access to:
    -- - districtType: District being placed (e.g., GameInfo.Districts["DISTRICT_CAMPUS"].Index)
    -- - pCity: City object with all city data
    -- - kPlot: Plot object where district would be placed
    
    -- YOUR CALCULATION HERE
    local calculatedYields = YourReverseAdjacencyCalculation(districtType, pCity, kPlot);
    
    -- Format for display (supports multiple yields)
    local bonusString = FormatYieldsForDisplay(calculatedYields);
    local bonusTooltip = CreateTooltipText(calculatedYields);
    
    return bonusString, bonusTooltip;
end
```

### Step 2: Yield Formatting Helper
Use this format for multiple yield types:

```lua
function FormatYieldsForDisplay(yields)
    local result = "";
    for yieldType, amount in pairs(yields) do
        if amount > 0 then
            local yieldInfo = GameInfo.Yields[yieldType];
            local iconName = "ICON_" .. yieldInfo.YieldType;
            local colorStyle = "Res" .. yieldInfo.YieldType .. "LabelCS";
            
            if result ~= "" then result = result .. ", "; end
            result = result .. "[" .. iconName .. "][COLOR:" .. colorStyle .. "]+" .. amount .. "[ENDCOLOR]";
        end
    end
    return result;
end
```

### Step 3: Conditional Display Logic
Modify `ShouldShowReverseAdjacencyBonus()` to control when bonuses appear:

```lua
function ShouldShowReverseAdjacencyBonus(districtType, pCity, kPlot)
    -- Add your conditions:
    -- - Check if adjacent districts exist that would benefit
    -- - Verify player has required technologies
    -- - Filter by district types
    return YourConditionLogic(districtType, pCity, kPlot);
end
```

### Integration Points Summary
- **Visual System**: Already complete - no UI work needed
- **Hook Point**: `GetAdjacentYieldBonusString` function in DistrictPlotIconManager
- **Data Source**: Replace functions in `ReverseAdjacencyConfig.lua`
- **Format**: Standard Civ 6 yield string format (automatically styled)

## 🎯 Mock Data Notice

This mod currently uses mock data (+9 Faith) to demonstrate the enhancement technique. **It does not affect actual gameplay** - it only shows where reverse adjacency information would appear.

## 🤝 Contributing

Contributions are welcome! This mod serves as a proof-of-concept for UI enhancement techniques. Possible improvements:

- Real reverse adjacency calculations
- Different yield types based on district interactions
- Conditional display based on technologies/civics
- Multiplayer compatibility testing

## 📄 License

This project is open source. The mod is designed for educational and enhancement purposes for Civilization VI.

## 🏆 Acknowledgments

- **Civilization VI** by Firaxis Games
- **Detailed Map Tacks mod** - Provided the proven implementation pattern
- **Cursor AI** - Development assistance and systematic approach

---

**Ready to see all your adjacency bonuses? Install and enjoy!** 🎮 