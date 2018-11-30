//
//  URL+Browser.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 30/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    
    func openInDefaultBrowser() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(self, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(self)
        }
    }
}
