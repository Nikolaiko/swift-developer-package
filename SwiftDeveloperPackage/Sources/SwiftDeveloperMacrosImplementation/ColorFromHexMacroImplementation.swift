import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros


public class ColorFromHexMacroImplementation: DeclarationMacro {
    public static func expansion(
        of node: some SwiftSyntax.FreestandingMacroExpansionSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        guard
                    let firstExpression = node.argumentList.first?.expression
                else {
                    throw UrlMacroError.requiresStaticStringLiteral
                }


        let header: PartialSyntaxNodeString =  "public struct Vectordssd<Element: Equatable>: Equatable"
                let structDeclSyntax =  try  StructDeclSyntax(header) {

                    for index in  0..<2 {

                        VariableDeclSyntax(
                            modifiers: .init(
                                arrayLiteral: .init(name: "public")
                            ),
                            .var,
                            name: "p\(literal: index + 1)",
                            type: .init(
                                type: SimpleTypeIdentifierSyntax(name: "Element")
                            )
                        )
                    }
                }

                return [
                    DeclSyntax(structDeclSyntax)
                ]
    }
}
