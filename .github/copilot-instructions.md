# ColorProfile-PS1

ColorProfile-PS1 is a simple PowerShell utility that displays all available console color combinations by showing each foreground color against each background color. This helps developers and users visualize how different color combinations appear in their terminal.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Prerequisites and Installation
- Verify PowerShell is installed: `which pwsh`
- If PowerShell is not installed on Ubuntu/Debian systems:
  ```bash
  # Download Microsoft GPG key and repository configuration
  curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
  curl -sSL "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -o /tmp/packages-microsoft-prod.deb
  sudo dpkg -i /tmp/packages-microsoft-prod.deb
  sudo apt-get update
  sudo apt-get install -y powershell
  ```
- Verify installation: `pwsh --version` (should show PowerShell 7.x)

### Running the Color Profile Script
- Execute the main script: `pwsh -File ColorProfile.ps1`
- Alternative execution method: `pwsh -Command "./ColorProfile.ps1"`
- **Execution time**: Takes approximately 3-4 seconds to complete. NEVER CANCEL.
- **Expected output**: 16 lines showing all color combinations (one line per background color)
- Each line displays all 16 foreground colors against the current background color

### Code Quality and Linting
- Run PowerShell Script Analyzer: `pwsh -Command "Invoke-ScriptAnalyzer -Path ColorProfile.ps1"`
- **Expected linting results**: 2 warnings about using `Write-Host` (these are intentional for this color display utility)
- PSScriptAnalyzer and Pester testing frameworks are available by default in PowerShell 7.x installations

### Testing and Validation
- **Basic functionality test**: Run the script and verify it produces exactly 16 lines of output
- **Validation command**:
  ```bash
  pwsh -File ColorProfile.ps1 > /tmp/test_output.txt 2>&1
  [ "$(wc -l < /tmp/test_output.txt)" -eq 16 ] && echo "✓ Test passed" || echo "✗ Test failed"
  ```
- **Error checking**: The script should execute without PowerShell errors
- **Manual validation**: Run the script and visually verify that:
  - All 16 console colors appear as foreground text
  - All 16 console colors appear as background colors  
  - Text shows color names (Black, DarkBlue, DarkGreen, etc.)
  - Each line ends with "on [BackgroundColor]"

## Validation Scenarios

### CRITICAL: Always run this complete validation after making changes
1. **Execute the script**: `pwsh -File ColorProfile.ps1`
2. **Verify output format**: Ensure each line contains all color names separated by "|" and ends with "on [color]"
3. **Check line count**: Verify exactly 16 lines of output (one per background color)
4. **Run linting**: `pwsh -Command "Invoke-ScriptAnalyzer -Path ColorProfile.ps1"`
5. **Verify expected warnings**: Should show exactly 2 "PSAvoidUsingWriteHost" warnings
6. **Visual verification**: Manually observe that colors are displayed correctly in the terminal

### Complete Validation Test Script
```bash
cd /path/to/repository
echo "=== Running Complete Validation ==="
pwsh -File ColorProfile.ps1 > /tmp/validation_output.txt 2>&1
lines=$(wc -l < /tmp/validation_output.txt)
[ "$lines" -eq 16 ] && echo "✓ Correct output lines" || echo "✗ Wrong line count: $lines"
pwsh -Command "Invoke-ScriptAnalyzer -Path ColorProfile.ps1" | grep -c "PSAvoidUsingWriteHost" | grep -q "2" && echo "✓ Expected warnings" || echo "✗ Unexpected linting results"
echo "=== Validation Complete ==="
```

## Repository Structure and Key Files

### Repository Contents
```
.
├── .git/                    # Git repository data
├── .gitattributes          # Git line ending configuration
├── ColorProfile.ps1        # Main PowerShell script (316 bytes)
└── .github/
    └── copilot-instructions.md  # This file
```

### Key Script Details
- **Primary file**: `ColorProfile.ps1`
- **Purpose**: Displays all 256 possible console color combinations (16 foreground × 16 background)
- **Dependencies**: Only requires PowerShell 7.x (uses built-in `[System.ConsoleColor]` enum)
- **Output**: Uses `Write-Host` with `-ForegroundColor` and `-BackgroundColor` parameters
- **Execution**: Fast execution (~3 seconds), no build process required

## Common Tasks and Commands

### File Operations
- View script content: `cat ColorProfile.ps1`
- Edit script: Use any text editor
- Check file size: `ls -la ColorProfile.ps1` (should be ~316 bytes)

### PowerShell Development
- Enter PowerShell interactive mode: `pwsh`
- Check available modules: `pwsh -Command "Get-Module -ListAvailable"`
- Test PowerShell syntax: `pwsh -Command "Get-Command Write-Host"`

### Git Operations
- Check repository status: `git status`
- View recent commits: `git log --oneline -5`
- Check for changes: `git diff`

## Troubleshooting

### Common Issues and Solutions
- **PowerShell not found**: Install using the commands in Prerequisites section
- **Permission denied**: Ensure execute permissions: `chmod +x ColorProfile.ps1` (if needed)
- **Colors not displaying**: Verify terminal supports ANSI colors
- **Script analyzer warnings**: The 2 "PSAvoidUsingWriteHost" warnings are expected and intentional

### Performance Notes
- Script execution is very fast (3-4 seconds)
- No compilation or build process required
- Minimal memory usage
- Safe to run repeatedly

## Development Guidelines

### Making Changes to ColorProfile.ps1
- Always test changes with: `pwsh -File ColorProfile.ps1`
- Run linting after changes: `pwsh -Command "Invoke-ScriptAnalyzer -Path ColorProfile.ps1"`
- Verify output still produces exactly 16 lines
- Ensure all console colors are still displayed correctly
- The use of `Write-Host` is intentional for color display purposes

### Code Style
- Follow PowerShell best practices except where `Write-Host` is required for color output
- Use descriptive variable names (current: `$colors`, `$bgcolor`, `$fgcolor`)
- Maintain the nested foreach loop structure for systematic color combination display
- Preserve the comment explaining color parameter usage