//
//  DataSender.swift
//  JRecor
//
//  Created by Junjie on 2021/6/1.
//

import Foundation
import Alamofire

class DataSender : NSObject {
    static let sharedSender : DataSender = {
       let sender = DataSender()
       return sender
    }()
    
    var update:((_ fileName: String , _ completedCount: Float) -> ())?
    var complete:(() -> ())?
    
    func sendAudio(filePath: URL) {
        let webUrl = URL(string: "http://192.168.3.34:5000/api/sendfile")!
        
        let audioData: Data? = try? Data(contentsOf: filePath)
        let fileName = filePath.lastPathComponent
        let paramName = "file"
        
        let boundary = UUID().uuidString
        let startBoundary = "--\(boundary)"
        let endingBoundary = "--\(boundary)--"
        
        var data = Data()
        data.append(("\(startBoundary)\r\n" as String).data(using:.utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append(("Content-Type: application/octet-stream\r\n\r\n" as String).data(using:.utf8)!)
        data.append(audioData!)
        data.append(("\r\n\(endingBoundary)\r\n" as String).data(using:.utf8)!)
        
        var request = URLRequest(url: webUrl)
        request.httpMethod = "post"
        request.setValue("multipart/form-data;boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        AF.upload(data, to: webUrl).uploadProgress(closure: {[weak self] (progress) in
            if let up = self?.update {
                up(fileName,Float(progress.completedUnitCount) * 0.01 / Float(progress.totalUnitCount))
            }
        }).responseJSON { response in
            if let cp = self.complete {
                cp()
            }
        }
    }
    
}
