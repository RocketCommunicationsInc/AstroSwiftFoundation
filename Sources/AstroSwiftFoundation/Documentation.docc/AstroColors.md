# AstroColors

Astro's Colors are imported as extensions to Color, UIColor, and NSColor.

## Overview

AstroSwiftFoundation colors include:
* Astro UI Colors - semantic colors for backgrounds, surfaces, and accents.
* Astro Status Colors - six colors representing Astro Status levels.
* Astro Classification Colors - representing US Government classification levels.

> Tip: See [Astro Launches](https://github.com/RocketCommunicationsInc/AstroLaunches) for example Astro color usage.

### Using UI Colors

Apple defines two systems (also known as "stacks") for structuring an iOS app's backgrounds.
Astro offers alternative background colors to give an Astro look in Light and Dark modes.

Each stack has three "levels" of background colors. The first color is intended to be the
main background, farthest back. Secondary and tertiary colors are layered on top
of the main background, when appropriate.

#### Primary Stack
Use this stack for views with standard table views, and designs which have a white primary background in light mode.

```swift
static var astroUIBackground:Color
static var astroUISecondaryBackground:Color
static var astroUITertiaryBackground:Color
```
#### Secondary Stack
Use this stack for views with grouped content, such as grouped tables and platter-based designs. These are like grouped table views, but you may use these colors in places where a table view wouldn't make sense.
```swift
static var astroUIGroupedBackground:Color
static var astroUISecondaryGroupedBackground:Color
static var astroUITertiaryGroupedBackground:Color
```

#### Accent Color
Accent color is applied to all controls, also used for Tint.
```swift
static var astroUIAccent:Color
```

### Using Status Colors
Consistent use of colors and symbols to convey status is critical for user success.

Astro's user research, conducted on a wide variety of space applications, showed that inconsistent and unconstrained use of colors and symbols left users confused and even dismissive of color systems. The research further showed that wide overuse of red to indicate both "off" and "emergency" stripped the color of its attention-getting power.

The Status Color palette for the Status System is based on a color temperature scale. The lowest level of severity, Off, is grey (neutral) and the highest level of severity, Alert, is red (hot).

```swift
static var astroStatusOff:Color
static var astroStatusStandby:Color
static var astroStatusNormal:Color
static var astroStatusCaution:Color
static var astroStatusSerious:Color
static var astroStatusCritical:Color
```
> Tip: Use ``Status`` and ``Tag`` views instead of using Status colors directly.

### Using Classification Colors
Classification and Control Markings are required for digital products created for government clients who interact with classified or controlled information. See [detailed reqirements](https://www.astrouxds.com/components/classification-markings/).

```swift
static var astroClassificationUnclassified:Color
static var astroClassificationCUI:Color
static var astroClassificationConfidential:Color
static var astroClassificationSecret:Color
static var astroClassificationTopSecret:Color
static var astroClassificationTopSecretSCI:Color
```
> Tip: Use ``ClassificationBanner`` and ``ClassificationMarker`` instead of using Classifiction colors directly.
