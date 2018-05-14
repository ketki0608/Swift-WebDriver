//
//  request.swift
//  Swift - WebDriver
//
//  Created by Ketki Potdar on 13/05/18.
//  Copyright © 2018 Ketki Potdar. All rights reserved.
//

import Foundation

class Request {
    
    // Method to submit http request synchronously
    @discardableResult
    func submitRequestSync(request: URLRequest) -> Data {
        var result: Data? = nil
        let semaphore = DispatchSemaphore(value: 0)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print("Error submitting request")
                return
            }
            result = responseData
            semaphore.signal()
        }
        task.resume()
        sleep(4)
        semaphore.wait()
        return result!
    }
}
