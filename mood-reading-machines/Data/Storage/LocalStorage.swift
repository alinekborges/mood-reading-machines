//
//  LocalStorage.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

protocol LocalStorage: class {
    var isLoggedIn: Bool { get set }
    
    func clear()
}
