//
//  SelectProfileViewModel.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 28/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import RxSwiftUtilities

class SelectProfileViewModel {
    
    let usernames: Driver<[String]>
    let isLoading: Driver<Bool>
    let selectedUser: Driver<User>
    let error: Driver<String>
    
    init(input: Driver<String>,
         repository: TwitterRepository) {
        
        //TODO: Repository for this
        usernames = Driver.just(["@elonmusk"])
        
        let loadingIndicator = ActivityIndicator()
        self.isLoading = loadingIndicator.asDriver()
        
        let userResult = input
            .asObservable()
            .flatMap { input in
                return repository.getUser(input)
                    .trackActivity(loadingIndicator)
                    .materialize()
                    .share()
        }
        
        self.selectedUser = userResult
            .elements()
            .asDriver(onErrorJustReturn: User())
        
        self.error = userResult
            .errors()
            .map { $0.localizedDescription }
            .asDriver(onErrorJustReturn: "Ops! Ocorreu um erro por aqui")
        
    }
}
