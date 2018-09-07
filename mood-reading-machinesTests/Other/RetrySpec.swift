//
//  RetrySpec.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftExt
import Quick
import Nimble
import Moya

@testable import mood_reading_machines

class RetrySpec: QuickSpec {
    
    let disposeBag = DisposeBag()
    
    override func spec() {
        
        describe("Testing retry behaviour") {
            
            it("Retries the right amount of times") {
                
                var errorCount = 0
                var count = 0
                
                let error = MoyaError.underlying(NSError(domain: NSURLErrorDomain, code: -1009, userInfo: nil), nil)
                
                let responses = [error, error, error]
                
                let observable = Observable.deferred { () -> Observable<Int> in
                    count += 1
                    guard responses.count >= count else {
                        assert(false, "Observable called too many times")
                        return .empty()
                    }
                    return .error(responses[count - 1])
                }
                
                observable
                    .retryWhenNeeded()
                    .subscribe(onNext: { _ in
                    }, onError: { _ in
                        errorCount += 1
                    }).disposed(by: self.disposeBag)
                
                expect(count).toEventually(be(2), timeout: 12.1) //Also testing correct ellapsed time
                expect(errorCount).toEventually(be(1), timeout: 12.1)
                
            }
            
            it("Don't retry if not the right errror") {
                
                var errorCount = 0
                var count = 0
                
                let error = MoyaError.underlying(NSError(domain: "", code: 404, userInfo: nil), nil)
                
                let responses = [error, error, error]
                
                let observable = Observable.deferred { () -> Observable<Int> in
                    count += 1
                    guard count <= 1 else {
                        assert(false, "Observable called too many times")
                        return .empty()
                    }
                    return .error(responses[count - 1])
                }
                
                observable
                    .retryWhenNeeded()
                    .subscribe(onNext: { _ in
                    }, onError: { _ in
                        errorCount += 1
                    }).disposed(by: self.disposeBag)
                
                expect(errorCount).toEventually(be(1), timeout: 20)
            }
            
        }
        
    }
    
}
