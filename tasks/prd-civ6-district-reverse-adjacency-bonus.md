# Product Requirements Document: Civilization 6 District Reverse Adjacency Bonus Enhancement

> **Note**: This PRD defines the product vision and requirements. The technical implementation approach will be determined through discovery of the actual game systems (see tasks document for research-first methodology).

## Introduction/Overview

This feature enhances the existing Civilization 6 district placement UI by displaying additional adjacency bonus information to players during district placement. Currently, when placing a new district, the game shows adjacency bonuses that the new district would receive from surrounding tiles. This enhancement adds visualization of the "reverse adjacency bonuses" - the benefits that the new district would provide to already-existing districts in the city.

The goal is to provide modders with a standalone demonstration of how to integrate reverse adjacency bonus data into whatever system the game uses for district placement information display, using mock data that can later be replaced with actual calculated values.

## Goals

1. **Enhance Decision-Making**: Provide players with complete adjacency information (both incoming and outgoing bonuses) during district placement
2. **Seamless Integration**: Add reverse adjacency data to existing UI elements without disrupting current game flow
3. **Modder-Friendly**: Create clean, documented code that other modders can easily understand and adapt
4. **Universal Compatibility**: Support all district types with consistent behavior
5. **Edge Case Handling**: Ensure functionality works even when tiles provide no base adjacency bonuses

## User Stories

1. **As a player placing a Commercial Hub**, I want to see both the adjacency bonus the tile provides to my Commercial Hub (+2 Gold from river) AND the reverse bonus my Commercial Hub would provide to existing districts (+9 Faith), so that I can make optimal placement decisions considering all adjacency effects.

2. **As a player placing any district type**, I want to see consistent reverse adjacency information displayed in the same familiar format as existing bonuses, so that I don't need to learn new UI patterns.

3. **As a modder**, I want clear, documented code that demonstrates how to inject additional data into the district placement tooltip system, so that I can adapt this technique for other modifications.

4. **As a player placing a district on a tile with no base adjacency bonuses**, I still want to see the reverse adjacency information, so that I understand the full impact of my district placement.

## Functional Requirements

1. **R1**: The system must display mock reverse adjacency bonus data ("+9 Faith") alongside existing adjacency bonuses in whatever UI system is discovered to handle district placement information
2. **R2**: The system must use the same visual styling (fonts, colors, icons) as existing adjacency bonus displays in the discovered system
3. **R3**: The system must integrate additional bonus information using the same formatting patterns as the discovered adjacency display system
4. **R4**: The system must use the native Civilization 6 Faith yield icon for the mock data display
5. **R5**: The system must apply the universal "+9 Faith" mock value to all district types during placement
6. **R6**: The system must handle cases where no base adjacency information is shown by still displaying the reverse adjacency mock data
7. **R7**: The system must integrate with the discovered district placement interface without breaking existing functionality
8. **R8**: The system must be implemented as actual Civilization 6 modification code (not just a visual mockup)
9. **R9**: The code must be structured as a standalone demonstration that can be easily understood and modified
10. **R10**: The system must maintain the existing display timing and positioning behavior of the discovered system

## Non-Goals (Out of Scope)

1. **Calculating Actual Reverse Bonuses**: This implementation uses mock data only; actual reverse bonus calculation logic is handled by a separate existing system
2. **District Type Differentiation**: All districts will show the same "+9 Faith" value; district-specific calculations are out of scope
3. **Yield Type Variation**: Only Faith yield icons will be used for mock data; other yield types are not included
4. **Performance Optimization**: Focus is on functionality demonstration, not optimized performance
5. **Multiplayer Compatibility**: Single-player demonstration only
6. **Configuration UI**: No in-game settings to modify the mock bonus values

## Design Considerations

- **Visual Consistency**: Must match existing Civilization 6 UI patterns exactly
- **Icon Usage**: Utilize the game's native Faith yield icon sprite/texture
- **Text Formatting**: Follow the game's existing format for adjacency bonus text
- **Tooltip Layout**: Append reverse bonus information to existing tooltip content without altering layout significantly
- **Color Scheme**: Use the game's standard adjacency bonus text colors

## Technical Considerations

- **Discovery-First Approach**: First discover how district placement and adjacency display actually works in the game
- **Implementation Method**: Determine the appropriate integration method based on discovered game systems (may be Lua, XML, or other approaches)
- **UI Integration Points**: Identify the actual system(s) responsible for displaying adjacency information during district placement
- **Data Structure**: Structure mock data in a format that can easily be replaced with real calculated values
- **File Organization**: Organize as a standalone mod with structure appropriate to the discovered integration method
- **Documentation**: Include inline comments explaining how to replace mock data with actual calculations
- **Compatibility**: Ensure compatibility with the actual district placement mechanics as discovered

## Success Metrics

1. **Functional Success**: Players can access district placement functionality and see both existing adjacency information and mock reverse adjacency bonuses displayed together in whatever system is discovered
2. **Visual Success**: The reverse adjacency bonus display is visually indistinguishable from native game adjacency displays in the discovered system
3. **Modder Adoption**: Code is clean and documented enough that other modders can understand and adapt it within 30 minutes of review
4. **Edge Case Coverage**: System works correctly regardless of existing adjacency information state, showing reverse adjacency mock data appropriately
5. **No Regressions**: All existing district placement functionality continues to work without any negative impacts

## Open Questions

1. Should the feature include any visual indicators to distinguish reverse bonuses from regular bonuses for clarity?
2. What should happen if future integration with real calculation logic provides yield types other than Faith?
3. Should there be any console logging or debug output for modders to verify the feature is working correctly?
4. How should the mock data behave if the game's UI language is changed to a non-English language?

## Implementation Notes

- The mock data format should be structured to easily accommodate future replacement with dynamic calculation results
- Configuration structure should be designed for easy modification of mock values once the implementation method is determined
- Ensure all file paths and asset references are appropriate to the discovered integration method and support easy mod installation
- Implementation approach should be determined based on research findings about how the game actually handles district placement and adjacency display 