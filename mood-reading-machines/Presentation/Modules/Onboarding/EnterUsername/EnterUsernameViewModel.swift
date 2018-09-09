//
//  EnterUsernameViewModel.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import RxSwiftUtilities

class EnterUsernameViewModel {
    
    let isValid: Driver<Bool>
    let isLoading: Driver<Bool>
    let selectedUser: Driver<User>
    
    init(input: Signal<String>,
         continueTap: Signal<Void>,
         repository: TwitterRepository) {
        
        let loadingIndicator = ActivityIndicator()
        self.isLoading = loadingIndicator.asDriver()
        
        let userResult = input
            .throttle(0.8)
            .filter { $0.count > 2 }
            .asObservable()
            .flatMap { input in
                return repository.getUser(input)
                    .trackActivity(loadingIndicator)
                    .materialize()
                    .share()
            }
        
        let user = userResult
            .elements()
        
        let error = userResult
            .errors()
        
        self.isValid = Observable.merge(
            user.map { _ in return true },
            error.map { _ in return false })
            .asDriver(onErrorJustReturn: false)
        
        self.selectedUser = continueTap
            .withLatestFrom(self.isValid)
            .filter { $0 } // filter only valid inputs
            .asObservable()
            .withLatestFrom(user)
            .asDriver(onErrorJustReturn: User())
        
    }
}
