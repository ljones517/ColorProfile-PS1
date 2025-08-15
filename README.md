# ColorProfile-PS1

A PowerShell utility for displaying and testing console color combinations. This script creates a comprehensive color matrix showing all available foreground and background color combinations in PowerShell.

## Description

ColorProfile-PS1 displays every possible combination of foreground and background colors available in PowerShell's console. It creates a visual grid that helps users:

- Test terminal color profile support
- Choose readable color combinations for PowerShell scripts
- Debug color display issues
- Verify terminal color capabilities

## Requirements

- PowerShell (any version that supports `Write-Host` with color parameters)
- Terminal or console that supports color output

## Usage

### Basic Usage

```powershell
# Run the script directly
.\ColorProfile.ps1
```

```powershell
# Or run with PowerShell command
pwsh -Command "& './ColorProfile.ps1'"
```

## Output

The script generates a color matrix where each row shows all 16 foreground colors displayed on a specific background color. The output format is:

```
Color1|Color2|Color3|...|Color16| on BackgroundColor
```

Each color name is displayed using its actual color, making it easy to see:
- Color visibility and readability combinations
- How colors appear on different backgrounds
- Which combinations provide good contrast

### Available Colors

The script uses all colors from the `System.ConsoleColor` enumeration:

- **Standard Colors**: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray
- **Bright Colors**: DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

## Use Cases

### For PowerShell Script Developers
- Choose appropriate color combinations for informational messages
- Ensure script output is readable across different terminal themes
- Test color-coded output before deployment

### For Terminal Users
- Verify terminal color support and configuration
- Test custom color schemes and themes
- Troubleshoot color display issues

### For Accessibility Testing
- Identify high-contrast color combinations
- Test readability for users with visual impairments
- Validate color choices meet accessibility standards

## Example Output

When you run the script, you'll see output similar to:
```
Black|DarkBlue|DarkGreen|DarkCyan|DarkRed|DarkMagenta|DarkYellow|Gray|DarkGray|Blue|Green|Cyan|Red|Magenta|Yellow|White| on Black
Black|DarkBlue|DarkGreen|DarkCyan|DarkRed|DarkMagenta|DarkYellow|Gray|DarkGray|Blue|Green|Cyan|Red|Magenta|Yellow|White| on DarkBlue
...
```

Each line shows all foreground colors on a different background, with the colors actually rendered in their respective hues.

## Code Usage in Scripts

The script demonstrates the PowerShell color parameters you can use in your own scripts:

```powershell
# Foreground color only
Write-Host "Your message" -ForegroundColor Green

# Background color only  
Write-Host "Your message" -BackgroundColor DarkBlue

# Both foreground and background
Write-Host "Your message" -ForegroundColor Yellow -BackgroundColor DarkRed
```

## License

This project is open source and available under standard open source terms.

## Contributing

Feel free to submit issues or pull requests to improve this utility.