import Foundation

@freestanding(expression)
public macro urlFromString(urlString stringLiteral: String) -> URL = #externalMacro(module: "SwiftDeveloperMacrosImplementation", type: "UrlFromStringMacroImplementation")
