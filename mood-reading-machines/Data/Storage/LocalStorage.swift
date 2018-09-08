//
//  LocalStorage.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

protocol LocalStorage: class {
    var accessToken: String? { get set }
    var user: User? { get set }
    
    func clear()
}
