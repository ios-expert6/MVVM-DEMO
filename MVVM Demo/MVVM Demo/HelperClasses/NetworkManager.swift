//
//  NetworkManager.swift
//
//
//  Created by Shrikant Upadhayay on 14/05/1942 Saka.
//  Copyright © 1942 mac. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetworkManager: NSObject {
    typealias NetwrokCompletion = (_ json:NSDictionary?,_ taskError:NSError?) -> Void

    static let sharedInstance = NetworkManager()
    private var jsonStrings:String?
    
    
    //Manual Parsing
    func executeService (_ url:String,_ parameters:Dictionary<String,Any>?,_ cb:@escaping NetwrokCompletion) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Content-Type":"application/json"]
        let session = URLSession(configuration: sessionConfiguration)
        
        
        let myUrl = URL.init(string: url)!
        var request = URLRequest(url: myUrl)
        request.setValue("1234", forHTTPHeaderField: "X-API-KEY")
        request.httpMethod = "POST"
        
        if let parameters = parameters {
            do {
                
                let jsonData = try!  JSONSerialization.data(withJSONObject: parameters, options: [])
                request.httpBody = jsonData            }
        }
        
        let dataTask = session.dataTask(with: request as URLRequest) { (taskData, taskResponse, taskError) in
            DispatchQueue.main.async {
                do {
                    if let taskD = taskData {
                        if let json = try JSONSerialization.jsonObject(with:
                            taskD, options:.mutableLeaves) as? NSDictionary {
                            cb(json, taskError as NSError?)
                        }else
                            if let json = try JSONSerialization.jsonObject(with:
                                taskD, options:.mutableLeaves) as? NSArray {
                                let object = NSDictionary.init(dictionary: ["response":json])
                                cb(object, taskError as NSError?)
                        }
                    }
                } catch let error as NSError {
                    print("ERROR:-",error)
                }
            }
        }
        dataTask.resume()
    }
    
}
