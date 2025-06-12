# Civilization VI Modding Knowledge Base

## Overview
This knowledge base consolidates information for creating Civilization VI mods manually without using the official SDK tools or ModBuddy, specifically for implementing the District Reverse Adjacency Bonus Enhancement feature.

## Key Information from Resources

### Mod Structure (Based on Civilization Wiki)
**Source**: [Civilization Wiki - Basics of Mod Creation](https://civilization.fandom.com/wiki/Modding_(Civ6)/Basics_of_Mod_Creation)

**Standard Mod Directory Structure:**
- **Root Mod Directory**: Contains the `.modinfo` file and all mod content
- **UI/**: Contains Lua files for user interface modifications
- **Data/**: Contains XML and SQL files for gameplay data modifications
- **Text/**: Contains XML files for text/localization
- **Art/**: Contains texture and model files (if needed)

**Key Files:**
- `ModName.modinfo`: Essential metadata file defining the mod
- Lua files in `UI/` folder for interface modifications
- XML files for data definitions
- SQL files for database modifications

### Content Modification Methods
**Source**: [Civilization Wiki - How to Alter Base Game Content](https://civilization.fandom.com/wiki/Modding_(Civ6)/How_to_Alter_Base_Game_Content)

**Two Primary Methods:**
1. **File Replacement**: Replace game files with custom versions (used for UI/Lua files)
   - Not recommended for most cases
   - Required for UI modifications
   - Must maintain exact file names and paths

2. **Database Manipulation**: Use SQLite/XML commands to modify game database
   - Preferred method for gameplay data
   - Cannot be used for UI changes
   - Uses SQL UPDATE commands

**SQLite Command Structure:**
```sql
UPDATE Table SET Column1=Value1, Column2=Value2 WHERE Column3=Condition;
```

**Important Notes:**
- String values use single quotes in SQLite
- Boolean values use 0/1 integers
- Comments start with double hyphens (--)

### DLC Compatibility Considerations
**Source**: [Civilization Wiki - Basic Mod/DLC Compatibility](https://civilization.fandom.com/wiki/Modding_(Civ6)/Basic_Mod/DLC_Compatibility)

**Key Compatibility Practices:**
- Use conditional SQL statements to check for DLC content
- Structure mods to work with and without specific DLCs
- Test functionality across different DLC configurations

## Specific Knowledge for Our Project

### District Placement UI System
**Target Area**: District placement tooltip system
**Implementation Approach**: 
- Hook into existing Lua UI files for district placement
- Extend tooltip generation to include reverse adjacency bonuses
- Maintain visual consistency with base game styling

### Required Mod Components for Our Feature

1. **ModInfo File**: Define mod metadata and dependencies
2. **UI Lua Script**: Hook into district placement tooltip system
3. **Mock Data Configuration**: Easily replaceable data structure for +9 Faith bonuses
4. **Documentation**: Clear instructions for modders

### Faith Yield Icon Integration
- Use game's native Faith yield icon system
- Maintain consistency with existing adjacency bonus displays
- Format: "existing bonus, +9 Faith" with proper icon integration

### Edge Case Handling
- Support tiles with no base adjacency bonuses
- Ensure compatibility across all district types
- Maintain existing game functionality

## File Locations and References

### Game Installation Directory
- **Base Game Files**: `F:\SteamLibrary\steamapps\common\Sid Meier's Civilization VI`
- **SDK Documentation**: `F:\SteamLibrary\steamapps\common\Sid Meier's Civilization VI SDK\Documentation`

### Mod Installation Location
- **User Mods Directory**: `~/My Games/Sid Meier's Civilization VI/Mods/`
- **Our Mod Path**: `~/My Games/Sid Meier's Civilization VI/Mods/ReverseAdjacencyMod/`

## Implementation Strategy

### Phase 1: Mod Structure Setup
- Create standard mod directory structure
- Implement modinfo file with proper metadata
- Set up development environment

### Phase 2: UI Integration Research
- Analyze existing district placement UI Lua files
- Identify tooltip generation functions
- Plan hook implementation strategy

### Phase 3: Mock Data and Integration
- Implement configurable mock data system
- Create tooltip extension functionality
- Ensure visual consistency

### Phase 4: Testing and Validation
- Test across all district types
- Validate edge cases
- Ensure no regressions in base functionality

## Important Constraints

- **No SDK Tools**: Manual file creation and management
- **Lua for UI**: All interface modifications require Lua scripting
- **Mock Data Only**: Implementation uses placeholder data, not actual calculations
- **Single-Player Focus**: Primary target is single-player demonstration
- **Faith Yield Only**: Universal +9 Faith bonus for all districts

## Next Steps for Implementation

1. Create mod directory structure
2. Research existing UI files for hook points
3. Implement mock data system
4. Develop tooltip extension system
5. Comprehensive testing across scenarios 