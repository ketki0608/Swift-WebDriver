//
//  webdriver.swift
//  Swift - WebDriver
//
//  Created by Ketki Potdar on 13/05/18.
//  Copyright © 2018 Ketki Potdar. All rights reserved.
//

import Foundation

class Webdriver {
    struct CreateSession: Codable {
        let desiredCapabilities: Capabilities
    }
    
    struct Capabilities: Codable {
        let browserName: String
    }
    
    struct Session: Codable {
        let sessionId: String
        let status: Int
    }
    
    struct Findelementresponse: Codable {
        let sessionId: String
        let status: Int
        let value: Element
    }
    
    struct Findelementinput: Codable {
        let using: String
        let value: String
    }
    
    struct Element: Codable {
        let ELEMENT: String
    }
    
    struct Navigate: Codable {
        let url: String
    }
    
    struct Sendkeys: Codable {
        let value: [String]
    }
    
    struct Frame: Codable {
        let id: String
    }
    
    // Method to retrieve session ID from api output
    func getSessionId(data: Data) -> String {
        var result: String? = ""
        let decoder = JSONDecoder()
        let session = try? decoder.decode(Session.self, from: data)
        result = (session?.sessionId)!
        return result!
    }
    
    // Method to retrieve element id from api output
    func getElement(data: Data) -> String {
        var result: String? = ""
        let decoder = JSONDecoder()
        let element = try? decoder.decode(Findelementresponse.self, from: data)
        result = (element?.value.ELEMENT)!
        return result!
    }
    
    // Method retrieve status from api output
    func getStatus(data: Data) -> Int {
        var result: Int? = -1
        let decoder = JSONDecoder()
        let session = try? decoder.decode(Session.self, from: data)
        result = (session?.status)!
        return result!
    }
    
    // WebDriver helper methods
    
    // Method to create browser session
    func createSession(sessionUrl: String) -> URLRequest {
        let url = URL(string: sessionUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let session = CreateSession(desiredCapabilities: Capabilities(browserName: browser))
        let data = try? JSONEncoder().encode(session)
        request.httpBody = data
        print(String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        return request
    }
    
    // Method to navigate to url provided by navigateTo input parameter
    func navigate(browserUrl: String, naviageTo: String)  -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let navigateTo = Navigate(url: naviageTo)
        let data = try? JSONEncoder().encode(navigateTo)
        request.httpBody = data
        print(String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        return request
    }
    
    // Method to set value of input element
    func sendKeys(browserUrl: String, value: [String]) -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let navigateTo = Sendkeys(value: value)
        let data = try? JSONEncoder().encode(navigateTo)
        request.httpBody = data
        print(String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        return request
    }
    
    // Method to switch frame
    func switchFrame(browserUrl: String, frame: String) -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let frame = Frame(id: frame)
        let data = try? JSONEncoder().encode(frame)
        request.httpBody = data
        print(String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        return request
    }
    
    // Method to locate element by Id
    func findElement(browserUrl: String, id: String) -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let element = Findelementinput(using: "id", value: id)
        let data = try? JSONEncoder().encode(element)
        request.httpBody = data
        print(String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        return request
    }
    
    // Method to click element
    func clickElement(browserUrl: String) -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    // Method to close browser window
    func closeWindow(browserUrl: String) -> URLRequest {
        let url = URL(string: browserUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        return request
    }

}
