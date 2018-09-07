//
//  BaseUITests+Utils.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import KIF

@testable import mood_reading_machines

extension BaseUITest {
    
    func expectToSee(_ text: String) {
        tester().waitForView(withAccessibilityIdentifier: text)
    }
    
    func expectNotToSee(_ text: String) {
        tester().waitForAbsenceOfView(withAccessibilityIdentifier: text)
    }
    
    func tapOnView(_ accessibilityIdentifier: String) {
        tester().tapView(withAccessibilityIdentifier: accessibilityIdentifier)
    }
    
    func getView(_ text: String) -> UIView {
        return tester().waitForView(withAccessibilityLabel: text)
    }
    
    func insertText(_ text: String, intoView view: String) {
        tester().enterText(text, intoViewWithAccessibilityIdentifier: view)
    }
}
