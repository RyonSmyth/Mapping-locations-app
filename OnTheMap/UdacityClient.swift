//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Ryan Smith on 2/13/17.
//  Copyright © 2017 Ryan Smith. All rights reserved.
//

import UIKit

class UdacityClient: NSObject {
    
    static func sessionID(_ username: String, _ password: String, completionHandlerForPOST: @escaping (_ success: Bool, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        
        let request = NSMutableURLRequest(url: URL(string: "https://www.udacity.com/api/session")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".data(using: String.Encoding.utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let range = Range(uncheckedBounds: (5, (data?.count)! - 5))
            let newData = data?.subdata(in: range)
            
            print(NSString(data: newData!, encoding: String.Encoding.utf8.rawValue)!)
            
         guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
              print("Code returned other than 2xx")
            return
           }
            
          
  
            
            
            completionHandlerForPOST(true, nil)
            
        }
        
        
        
        task.resume()
        return task
    }
    

}
