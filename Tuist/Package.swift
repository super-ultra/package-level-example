// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        targetSettings: [
            "Logger": SettingsDictionary()
                .appendingWarningFlags()
        ]
    )

extension SettingsDictionary {
    public func appendingWarningFlags() -> SettingsDictionary {
        let flags = [
            "-Xfrontend -debug-time-expression-type-checking",
            "-Xfrontend -debug-time-function-bodies",
            "-Xfrontend -warn-long-function-bodies=200",
            "-Xfrontend -warn-long-expression-type-checking=200"
        ]

        return merging(["OTHER_SWIFT_FLAGS": .array(flags)])
    }
}

#endif

let package = Package(
    name: "PackageLevel",
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing", .upToNextMajor(from: "0.7.0")),
        .package(name: "logger", path: "../packages/logger")
    ]
)
