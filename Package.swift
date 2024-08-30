// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let versionString = "10.25.1"

let binaryFrameworks: [(String, String)] = [
    ("FirebaseABTesting",           "7e9eb5a4371058b5293b0077271728a2e81ccad1c71b0dcca61c8ec276adee4e"),
    ("FirebaseCore",                "7ea67c597ffc2b3447477f3b83f7d68dad53c6caa47f053c5713fb2cc962bd6c"),
    ("FirebaseCoreExtension",       "8486a8269cd81d526f0e41cff451983067a140e2296134e4c3de76364581d892"),
    ("FirebaseCoreInternal",        "2767554823821922b43be5910bc09edbc719db46c740856cdadb39fcf765ba45"),
    ("FirebaseCrashlytics",         "34621220270b529a4f380ba458629be290eb42137048c70da64daadf1db48b6d"),
    ("FirebaseInstallations",       "46e0da8c31751b5b393974b3232be2396a59eacae374e0ab899726676d1008c6"),
    ("FirebaseRemoteConfig",        "dbfe3d93f14b2bb80e94c8e9fb8aab9068e422bbad7316caec04ea556f745fda"),
    ("FirebaseRemoteConfigInterop", "5f94e800b7f3fcab379a0d0930ac0e1c9d84e19723ea9ca6c989391ac21af740"),
    ("FirebaseSessions",            "d36fc6112f98fe404e8997c09f3efda96db3ed1420500c1e344cf0d4b1264512"),
    ("FirebaseSharedSwift",         "c3ae02389b641367775eaf0a9e583b4baee359e7c5afd8fafc8b6537a7927c4f"),
    ("GoogleDataTransport",         "6aecb49a89712c46f8b9c4770fc1818b8dbdd460a9ef5de797101bbbc70ad96e"),
    ("GoogleUtilities",             "8cc247841b32a0cc944ca56380d0392f3b07384599ee9f173cf508de5878d796"),
    ("Promises",                    "7a37a6f36a46cca64bf7bb0a1d96a717ecbb65f9dadfdf7d35bf7b818ab515ca"),
    ("nanopb",                      "ba132ecabc4d2d3c82f1945d8cc62055fe2ff5c5f47f6e92cb6fdbae684a6433"),
    ("FBLPromises",                 "c584222018d9c4a8acbfc27c36e875741b53d077b96b3d696e98fa3269b1d2bb"),
]

let products: [Product] = binaryFrameworks.map { .library(name: $0.0, targets: [$0.0]) }

var targets: [Target] = binaryFrameworks.map { item in
        .binaryTarget(
            name: "\(item.0)",
            url: "https://github.com/richardnees/firebase-xcframeworks/releases/download/\(versionString)/\(item.0).xcframework.zip",
            checksum: "\(item.1)"
        )
}
// https://github.com/richardnees/firebase-xcframeworks/releases/download/10.25.0/FirebaseRemoteConfig.xcframework.zip

targets.append(contentsOf: [
    .target(
        name: "Firebase",
        dependencies: binaryFrameworks.map { Target.Dependency(stringLiteral: $0.0) }
    )
])

let package = Package(
    name: "Firebase",
    products: products,
    targets: targets
)
