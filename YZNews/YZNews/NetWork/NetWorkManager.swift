//
//  NetWorkManager.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/17.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

public typealias Parameters = [String: String]

class NetWorkManager: NSObject {
    static func request(url: String, parameters: Parameters, completed: @escaping (Any) -> ()) {
        
        var request: URLRequest = URLRequest(url: URL(string: url + NetWorkManager.getHTTPUrl(parameters: parameters))!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            let reponse = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            DispatchQueue.main.async {
                completed(reponse)
            }
        }
        task.resume()
    }
    
    static private func getHTTPUrl(parameters: Parameters) -> String {
        var paramStr: String = "?"
        for (key,value) in parameters {
            paramStr += (key + "=" + value + "&")
        }
        paramStr.removeLast()
        return paramStr
    }
}
