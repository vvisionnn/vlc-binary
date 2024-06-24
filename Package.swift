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
      checksum: "1911db578a13680f55fc2d6337a0070f04dc690cd59da5da41e21317a90817ab" // MobileVLCKit
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/TVVLCKit.xcframework.zip",
      checksum: "7f8defcf03ff7767d656f70e3a56c2b8f75b16ebb09311bb6c78e2614c0af6e6" // TVVLCKit
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/VLCKit.xcframework.zip",
      checksum: "0b20b309f55be1ce0d88b885758476e09948a4677182549b75ea0c3f27f8e1cc" // VLCKit
    ),
  ]
)