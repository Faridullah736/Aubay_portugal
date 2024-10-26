// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Population",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Population",
            targets: ["Population"]),
    ],
    dependencies: [
        // Internals
        .package(path: "../../Packages/PopulationInfastructure"),
        .package(path: "../../Packages/Utils")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Population",
            dependencies: [
                // Internals
                "PopulationInfastructure",
                "Utils"
            ]),
        .testTarget(
            name: "PopulationTests",
            dependencies: ["Population"]
        ),
    ]
)
