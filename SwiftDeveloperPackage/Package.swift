// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "SwiftDeveloperPackage",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftDeveloperMacros",
            targets: ["SwiftDeveloperMacros"]),
        .library(
            name: "SwiftDeveloperPackage",
            targets: ["SwiftDeveloperPackage"]),
        .executable(
            name: "MacrosDemo",
            targets: ["MacrosDemo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(name: "SwiftDeveloperMacrosImplementation",
               dependencies: [
                   .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                   .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
               ]
            ),
        .target(
            name: "SwiftDeveloperMacros",
            dependencies: ["SwiftDeveloperMacrosImplementation"]
        ),
        .target(
            name: "SwiftDeveloperPackage"),

        .executableTarget(
            name: "MacrosDemo",
            dependencies: ["SwiftDeveloperMacros"]
        ),
        .testTarget(
            name: "SwiftDeveloperPackageTests",
            dependencies: ["SwiftDeveloperPackage"]),
    ]
)
