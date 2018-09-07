//
//  EnvironmentVariables.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

func getEnvironmentVar(_ name: String) -> String {
    guard let rawValue = getenv(name) else {
        fatalError("Please register \(name) environment variable! For more instructions, check README.md or contact the project owner")
    }
    return String(utf8String: rawValue)!
}
