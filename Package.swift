// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "VLC",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "VLC",
      targets: [
        "VLC",
      ]
    ),
  ],
  targets: [
    .target(
      name: "VLC",
      dependencies: [
        .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
        .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS])),
        .target(name: "VLCKit", condition: .when(platforms: [.macOS])),
      ],
      path: "Sources",
      linkerSettings: [
        .linkedFramework("MobileVLCKit", .when(platforms: [.iOS])),
        .linkedFramework("TVVLCKit", .when(platforms: [.tvOS])),
        .linkedFramework("VLCKit", .when(platforms: [.macOS])),
      ]
    ),
    .binaryTarget(
      name: "MobileVLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/MobileVLCKit.xcframework.zip",
      checksum: "bc08cf3741eb4dc9979b46452681e59448f33e28b525e48f066999bb81630823" // MobileVLCKit
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/TVVLCKit.xcframework.zip",
      checksum: "5091f25c252f1c679f63e7b3791bff1e1cd4dfa79f3d812ec52bba44bced2583" // TVVLCKit
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/VLCKit.xcframework.zip",
      checksum: "df67a4f295edba17890fddeeae5eab93e335b056b9aaaba4d08f61eb7a0a09cd" // VLCKit
    ),
  ]
)