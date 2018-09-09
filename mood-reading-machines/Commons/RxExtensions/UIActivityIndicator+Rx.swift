//
//  UIActivityIndicator+Rx.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIActivityIndicatorView {
    
    var isLoading: Binder<Bool> {
        return Binder(self.base) { base, isLoading in
            base.isHidden = !isLoading
            
            if isLoading {
                base.startAnimating()
            } else {
                base.stopAnimating()
            }
        }
    }
    
}
