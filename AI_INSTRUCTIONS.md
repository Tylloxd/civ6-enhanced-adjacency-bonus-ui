# AI Instructions for District Reverse Adjacency Enhancement Project

## XML/ModInfo Handling Rules

### ❌ DO NOT "FIX" THE NAME TAG
- The `<Name>` tag in `ReverseAdjacencyMod.modinfo` is **CORRECT**
- **NEVER** suggest changing `<Name>` to `<n>` or vice versa
- **NEVER** mention "broken XML" regarding the Name tag
- If you see `<Name>District Reverse Adjacency Enhancement</Name>`, this is **PROPER XML**

### File Edit Tool Behavior
- The `edit_file` tool sometimes shows output with `<n>` instead of `<Name>` - this is a **TOOL DISPLAY ISSUE**, not an actual file problem
- **IGNORE** any tool output showing `<n>` tags
- **DO NOT** attempt to "fix" what the tool output shows

## Project-Specific Context

### Current Status
- Working on implementing reverse adjacency bonuses in Civilization VI district placement tooltips
- Using function hooking approach via `GetAdjacentYieldBonusString`
- Focus on debugging mod loading issues, not XML syntax

### Common Issues to Ignore
1. Name tag "corrections" (covered above)
2. Tool display artifacts in XML
3. PowerShell interface errors (use alternative approaches)

## Debugging Priorities
1. Check for debug messages in console output
2. Verify mod files are loading
3. Test function hooking effectiveness
4. Focus on actual functionality, not cosmetic XML issues 