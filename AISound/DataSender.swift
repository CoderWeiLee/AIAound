//
//  DataSender.swift
//  JRecor
//
//  Created by Junjie on 2021/6/1.
//

import Foundation
import CoreServices


class DataSender: NSObject {
    
    override init() {
        super.init()
    }
    
    func sendAudio(filePath: URL) {
        /*
         Function: send recording data to server
         Parameter:
         Return:
         */
        let webUrl = URL(string: "http://192.168.3.34:5000/api/sendfile")!
        
        let audioData: Data? = try? Data(contentsOf: filePath)
        let fileName = filePath.lastPathComponent
        let paramName = "file"
        
        let boundary = UUID().uuidString
        let startBoundary = "--\(boundary)"
        let endingBoundary = "--\(boundary)--"
        
        var body = Data()
        body.append(("\(startBoundary)\r\n" as String).data(using:.utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        body.append(("Content-Type: application/octet-stream\r\n\r\n" as String).data(using:.utf8)!)
        body.append(audioData!)
        body.append(("\r\n\(endingBoundary)\r\n" as String).data(using:.utf8)!)
        
        var request = URLRequest(url: webUrl)
        request.httpMethod = "post"
        request.setValue("multipart/form-data;boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.uploadTask(with: request, from: body){ (data, response, error) in
            if let error = error{
                print("error: \(error)")
                return
            }

            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print("Error on server side!")
                    return
            }

            if let mimeType = response.mimeType,
            mimeType == "audio/m4a",
            let data = data,
                let dataStr = String(data: data, encoding: .utf8){
                print("data is \(dataStr)")
            }
        }
        
        print(body)
        print(filePath)
        
        task.resume()
    }

}
