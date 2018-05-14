//
//  constants.swift
//  Swift - WebDriver
//
//  Created by Ketki Potdar on 13/05/18.
//  Copyright © 2018 Ketki Potdar. All rights reserved.
//

import Foundation

// Login page constants
let navigateUrl = "http://www.icloud.com"
let frameId = "auth-frame"
let userNameInput = "account_name_text_field"
let passwordInput = "password_text_field"
let signInButton = "sign-in"

// Web driver constants
let browser = "chrome"
let sessionUrl = "http://localhost:9515/session"   // ChromeDriver is running on port 9515 locally

// Web driver apis
let navigate = "/url"
let switchFrame = "/frame"
let findElement = "/element"
let setValue = "/value"
let click = "/click"
let window = "/window"
