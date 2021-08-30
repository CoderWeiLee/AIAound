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
}


func getFileDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
