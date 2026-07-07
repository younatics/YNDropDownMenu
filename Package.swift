// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "YNDropDownMenu",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "YNDropDownMenu", targets: ["YNDropDownMenu"])
    ],
    targets: [
        .target(
            name: "YNDropDownMenu",
            path: "YNDropDownMenu",
            exclude: [
                "YNDropDownMenu.h",
                "Info.plist"
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "YNDropDownMenuTests",
            dependencies: ["YNDropDownMenu"],
            path: "Tests/YNDropDownMenuTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
