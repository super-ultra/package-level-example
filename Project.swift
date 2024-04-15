import ProjectDescription

let project = Project(
    name: "PackageLevel",
    targets: [
        .target(
            name: "PackageLevel",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.PackageLevel",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["PackageLevel/Sources/**"],
            resources: ["PackageLevel/Resources/**"],
            dependencies: [
                .external(name: "Logger")
            ]
        ),
        .target(
            name: "PackageLevelTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.PackageLevelTests",
            infoPlist: .default,
            sources: ["PackageLevel/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "PackageLevel"),
                .external(name: "Testing")
            ]
        ),
    ]
)
