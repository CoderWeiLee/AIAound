//
//  Supply.swift
//  JRecor
//
//  Created by Junjie on 2021/4/6.
//

import Foundation


struct Recording {
    let fileURL: URL
    let createdAt: Date
    let fileSize: String
    var indexPath: IndexPath?
    var nameTime: String {
        get {
            //Convert date to yyyy-mm-dd string
            let fmt = DateFormatter(format: "yyyy-MM-dd")
            return "\(fmt.string(from: createdAt))"
        }
    }
    
    var detailTime: String {
        get {
            //Convert date to hh:MM string
            let fmt = DateFormatter(format: "hh:MM")
            return fmt.string(from: createdAt)
        }
    }
}


func getFileDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}

func sizeForLocalFilePath(filePath:String) -> UInt64 {
    do {
        let fileAttributes = try FileManager.default.attributesOfItem(atPath: filePath)
        if let fileSize = fileAttributes[FileAttributeKey.size]  {
            return (fileSize as! NSNumber).uint64Value
        } else {
            print("Failed to get a size attribute from path: \(filePath)")
        }
    } catch {
        print("Failed to get file attributes for local path: \(filePath) with error: \(error)")
    }
    return 0
}
func covertToFileString(with size: UInt64) -> String {
    let convertedValue: Double = Double(size) / (1024 * 1024)
    return String(format: "%.2f MB", convertedValue)
}
