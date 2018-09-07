//
//  CloudTagView+Rx.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: CloudTagView {
    
    var items: Binder<[String]> {
        return Binder(self.base) { tagView, items in
            tagView.items = items
        }
    }
    
    var tagSelected: Driver<String> {
        return base.collectionView.rx.modelSelected(String.self)
            .asDriver(onErrorJustReturn: "")
    }
    
}
