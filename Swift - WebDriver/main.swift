//
//  main.swift
//  Swift - WebDriver
//
//  Created by Ketki Potdar on 13/05/18.
//  Copyright © 2018 Ketki Potdar. All rights reserved.
//

import Foundation

let request = Request()
let driver = Webdriver()
let userName = "abcd"
let password = "abcd"

// Create Chrome browser session
var data = request.submitRequestSync(request: driver.createSession(sessionUrl: sessionUrl))
let sessionId = driver.getSessionId(data: data)
let urlprefix = sessionUrl+"/"+sessionId

// Navigate to http://www.icloud.com
request.submitRequestSync(request: driver.navigate(browserUrl: urlprefix+navigate, naviageTo: navigateUrl))

// Switch to iframe - auth-frame
request.submitRequestSync(request: driver.switchFrame(browserUrl: urlprefix+switchFrame, frame: frameId))

// Locate username input element
data = request.submitRequestSync(request: driver.findElement(browserUrl: urlprefix+findElement, id: userNameInput))
let usernameInputElement =  driver.getElement(data: data)

// Enter user name in located element and click sign in arrow to submit
var setvalue = driver.sendKeys(browserUrl: urlprefix+"/element/"+usernameInputElement+setValue, value: [userName])
request.submitRequestSync(request: setvalue)
data = request.submitRequestSync(request: driver.findElement(browserUrl: urlprefix+findElement, id: signInButton))
var signin =  driver.getElement(data: data)
var clickelement = driver.clickElement(browserUrl: urlprefix+"/element/"+signin+click)
request.submitRequestSync(request: clickelement)

// Locate password input element
data = request.submitRequestSync(request: driver.findElement(browserUrl: urlprefix+findElement, id: passwordInput))
let passwordInputElement =  driver.getElement(data: data)

// Enter password in located element and click sign in arrow to submit
setvalue = driver.sendKeys(browserUrl: urlprefix+"/element/"+passwordInputElement+setValue, value: [password])
request.submitRequestSync(request: setvalue)
data = request.submitRequestSync(request: driver.findElement(browserUrl: urlprefix+findElement, id: signInButton))
signin =  driver.getElement(data: data)
clickelement = driver.clickElement(browserUrl: urlprefix+"/element/"+signin+click)
request.submitRequestSync(request: clickelement)

// Close open window
request.submitRequestSync(request:driver.closeWindow(browserUrl: urlprefix+window))
