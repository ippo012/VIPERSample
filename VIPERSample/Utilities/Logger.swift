//
//  Logger.swift
//  VIPERSample
//
//  Created by Ippo Matsui on 2019/04/28.
//  Copyright © 2019 Ippo Matsui. All rights reserved.
//

// see: https://github.com/sauvikdolui/swiftlogger/blob/master/SwiftLogger/Debug/Logger.swift
import Foundation

/// Wrapping Swift.print() within DEBUG flag
///
/// - Note: *print()* might cause [security vulnerabilities](https://codifiedsecurity.com/mobile-app-security-testing-checklist-ios/)
///
/// - Parameter object: The object which is to be logged
///
func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

class Logger {
    fileprivate static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    fileprivate static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    /// Logs messages on console
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    class func log( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        #if DEBUG
        print("\(Date().toString()) [\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        #endif
    }
    
    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String {
        return Logger.dateFormatter.string(from: self as Date)
    }
}
