# Civilization VI Enhanced Adjacency Bonus UI

A Civilization VI mod that enhances the district placement interface by displaying reverse adjacency bonuses - showing the benefits that the new district would provide to existing districts in your city.

## 🎯 What This Mod Does

When placing a district in Civilization VI, the game normally shows you the adjacency bonuses that the new district would receive from surrounding tiles. This mod **adds** information about the reverse adjacency bonuses - the benefits your new district would provide to existing districts.

### Before vs After
- **Before**: See only "+2 Gold from River" when placing a Commercial Hub
- **After**: See "+2 Gold from River, +9 Faith" - now including the reverse bonus

## ✨ Features

- **Seamless Integration**: Uses the existing adjacency bonus display system
- **Native Styling**: Matches the game's visual style perfectly
- **All Districts**: Works with every district type
- **Edge Case Handling**: Functions whether or not base adjacency bonuses exist
- **Tooltip Support**: Enhanced tooltips with detailed information
- **Mock Data**: Demonstrates +9 Faith bonus (easily replaceable with real calculations)

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

## 🎯 Future Enhancement

This mod uses mock data (+9 Faith) to demonstrate the enhancement technique. The structure is designed to easily integrate with actual reverse adjacency calculation logic:

1. Replace `GetMockReverseAdjacencyBonus()` function
2. Add real calculation logic for district-to-district bonuses
3. Customize bonus amounts based on actual game rules

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