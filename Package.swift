// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 这是 Package.swift 必须声明的版本信息。


import PackageDescription
// Package代表整个 Swift Package。
let package = Package(
    name: "MyLibrary",
    
    // 定义支持的平台和最低系统版本。
    platforms: [
        .iOS(.v15),
    ],
    
    // 一个 Package 可以包含多个 Target，也可以提供多个 Product。
    // 定义对外提供什么产品。
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MyLibraryOC",
            type: .static,
            targets: ["MyLibraryOC"]
        ),
        .library(
            name: "MyLibrarySwift",
            type: .static,
            targets: ["MyLibrarySwift"]
        ),
    ],
    dependencies: [
//        .package(
//               url: "https://github.com/Alamofire/Alamofire.git",
//               from: "5.9.0" // exact 表示严格使用指定版本。/ from: "5.9.0" 表示使用兼容 5.9.0 的版本范围，通常允许自动选择后续兼容的 5.x 版本
//           ),
//        .package( 这里通过本地文件路径引用另一个 Package。
//               path: "../MyNetwork"
//           )
    ], //Package.Dependency]
    
    targets: [ // Target 是 Swift Package 最基础的构建单元, 一个 Target 不能同时混合 Swift 和 C 系列语言的源码。
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target( // .target：普通代码模块。
            name: "MyLibrarySwift",
            
            dependencies: [
//                .product(
//                    name: "Alamofire",
//                    package: "Alamofire"
//                )
            ],
//            path:"MyLibrarySwift",// 当那么与source下的目录名称完全一致，则无需设置path参数，swiftpm默认查找name参数同名目录
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
        .target(
            name: "MyLibraryOC",
            
        ),
        /**
         以二进制形式分发 Swift Package
         这里需要提供：
         - XCFramework 压缩包下载地址。
         - 对应的 checksum 校验值。
         SwiftPM 会下载并校验二进制文件。
         */
//        .binaryTarget(
//            name: "MyBinarySDK",
//            url: "https://example.com/MyBinarySDK.xcframework.zip",
//            checksum: "文件校验值"
//        ),
        // 直接引用本地的 XCFramework。
//            .binaryTarget(
//                name: "MyBinarySDK",
//                path: "Frameworks/MyBinarySDK.xcframework"
//            ),
//        .binaryTarget(name: <#T##String#>, path: <#T##String#>)
        .testTarget( // 单元测试模块
            name: "MyLibraryTests",
            dependencies: ["MyLibrarySwift"],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
