//MyLibrarySwift-Swift.h 是 Xcode 为某个已编译 Swift target 生成的 Objective-C 兼容头。SwiftPM 默认不会把 Swift target 的这个头暴露为可供其他 target 用 <模块名-Swift.h> 导入的公共接口。
//
//正确做法取决于你从哪里使用它：
//
//在 Swift 文件中使用：

// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public func hello() {
    print("Hello, world!")
}

@objcMembers
public final class TestHello: NSObject {
    public func hello() {
        print("Hello, world!")
    }
}
