//
//  BaseUITests.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import KIF
import Swinject
import UIKit

@testable import mood_reading_machines

class BaseUITest: KIFTestCase {
    
    let defaultContainer = DefaultContainer()
    var window: UIWindow!
    var coordinator: AppCoordinator?
    
    override func beforeEach() {
        
        UIView.setAnimationsEnabled(false)
        
        self.configureContainer(container: self.defaultContainer.container)
        
        self.window = UIApplication.shared.keyWindow!
        
        self.coordinator = AppCoordinator(window: window, container: self.defaultContainer.container)
        
        coordinator?.start()
    }
    
    func configureContainer(container: Container) {
        fatalError("mockContainer must be overritten")
    }
    
}
