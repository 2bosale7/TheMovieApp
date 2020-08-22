//
//  ServiceManager.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ServiceManager: NSObject {
    
    typealias ApiResponse = (Error?, JSON?) -> Void
    
    class func callAPI(url: String, method: HTTPMethod, parameters: [String: Any]?, custumHeaders: HTTPHeaders?, onCompletion: @escaping ApiResponse) -> Void
    {
        var headers: HTTPHeaders!
        headers = ["Content-Type": "application/json"]
        
        if let head = custumHeaders
        {
            headers = head
        }
        
        print("===============================================")
        print("url = \(url)")
        print("headers = \(headers ?? [:])")
        print("parameters = \(parameters ?? [:])")
        print("===============================================")
        
        AF.request(URL(string: url)!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                    case .success:
                        if let response = response.value {
                            onCompletion(nil, JSON(response))
                        }else{
                            onCompletion(response.error, nil)
                    }
                    case let .failure(error):
                        onCompletion( error, nil)
                }
        }
    }
}
