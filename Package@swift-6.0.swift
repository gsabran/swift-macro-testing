// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swift-macro-testing",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "MacroTesting",
      targets: ["MacroTesting"]
    )
  ],
  dependencies: [
    // TODO: Remove this fork original supports Swift 602.x
    .package(url: "https://github.com/gsabran/swift-snapshot-testing", revision: "919ae5136eeeee7759568b4125b95de7c34ef60b"),
    .package(url: "https://github.com/swiftlang/swift-syntax", "509.0.0"..<"603.0.0"),
  ],
  targets: [
    .target(
      name: "MacroTesting",
      dependencies: [
        .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
        .product(name: "SwiftDiagnostics", package: "swift-syntax"),
        .product(name: "SwiftOperators", package: "swift-syntax"),
        .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
    .testTarget(
      name: "MacroTestingTests",
      dependencies: [
        "MacroTesting"
      ]
    ),
  ],
  swiftLanguageModes: [.v5]
)
