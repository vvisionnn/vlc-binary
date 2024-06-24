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
      checksum: "847835f6e5edf25ee074f826c74a27cd45d0c789e181626f43f510d15e9bde72" // MobileVLCKit
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/TVVLCKit.xcframework.zip",
      checksum: "5a1441ec4c11f167e601ea6d4de227a22b268046816724293d3f7792dbabce59" // TVVLCKit
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/vvisionnn/vlc-binary/releases/download/3.6.0/VLCKit.xcframework.zip",
      checksum: "409059b32dc037d90ad52a61c9508d8817564782aaffeaf0ab56490b10df03c2" // VLCKit
    ),
  ]
)