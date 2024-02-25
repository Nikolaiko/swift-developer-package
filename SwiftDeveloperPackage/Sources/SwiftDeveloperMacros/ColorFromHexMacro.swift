import Foundation

@freestanding(declaration, names: arbitrary)
public macro colorFromHex(colorName: String, hexValue: String) = #externalMacro(module: "SwiftDeveloperMacrosImplementation", type: "ColorFromHexMacroImplementation")
