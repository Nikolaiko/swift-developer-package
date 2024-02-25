import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

public class UrlFromStringMacroImplementation: ExpressionMacro {
    public static func expansion(
        of node: some SwiftSyntax.FreestandingMacroExpansionSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> SwiftSyntax.ExprSyntax {
            guard
                let argument = node.argumentList.first?.expression,
                let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
                segments.count == 1,
                case .stringSegment(let literalSegment)? = segments.first
            else {
                throw UrlMacroError.requiresStaticStringLiteral
            }

            guard let _ = URL(string: literalSegment.content.text) else {
                throw UrlMacroError.malformedURL(urlString: "\(argument)")
            }
            return "URL(string: \(argument))!"
    }
    
    
}

@main
struct SwiftDeveloperMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        UrlFromStringMacroImplementation.self,
        ColorFromHexMacroImplementation.self
    ]
}

