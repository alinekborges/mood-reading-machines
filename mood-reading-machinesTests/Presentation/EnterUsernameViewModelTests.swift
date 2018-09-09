//
//  EnterUsernameViewModelTests.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import Nimble
import XCTest
import RxBlocking

@testable import mood_reading_machines

class EnterUsernameViewModelTests: XCTestCase {
    
    var viewModel: EnterUsernameViewModel!
    var repository: MockTwitterRepository!
    
    let disposeBag = DisposeBag()
    
    var input: PublishSubject<String>!
    var continueTap: PublishSubject<()>!
    
    //Before each
    override func setUp() {
        self.input = PublishSubject<String>()
        self.continueTap = PublishSubject<()>()
        self.repository = MockTwitterRepository()
        
        self.viewModel = EnterUsernameViewModel(
            input: input.asSignal(onErrorJustReturn: ""),
            continueTap: continueTap.asSignal(onErrorJustReturn: ()),
            repository: repository)
    }
    
    //After each
    override func tearDown() {
        self.input = nil
        self.continueTap = nil
        self.repository = nil
        self.viewModel = nil
    }
    
    func test_isValid_shouldBeTrue_afterValidInput() {
        
        var isValid = false
        
        self.viewModel.isValid
            .drive(onNext: {
                isValid = $0
            }).disposed(by: disposeBag)
        
        self.input.onNext("Test")
        
        expect(isValid).toEventually(beTrue())
        
    }
    
    func test_isValid_shouldBeFalse_afterValidInput() {
        
        var isValid = true
        
        self.repository.isSuccess = false
        
        self.viewModel.isValid
            .drive(onNext: {
                isValid = $0
            }).disposed(by: disposeBag)
        
        self.input.onNext("Test")
        
        expect(isValid).toEventually(beFalse())
        
    }
    
    func test_isValid_shouldBeFalse_afterValidInputAndThenInvalidInput() {
        
        var isValid = true
        
        self.viewModel.isValid
            .drive(onNext: {
                isValid = $0
            }).disposed(by: disposeBag)
        
        self.input.onNext("Test")
        
        self.repository.isSuccess = false
        
        self.input.onNext("Test2")
        
        expect(isValid).toEventually(beFalse())
        
    }
    
    func test_selectedUser_shouldBeInvoked_whenContinueIsTapped() {
        
        var user: User?
        
        self.viewModel.selectedUser
            .drive(onNext: {
                user = $0
            }).disposed(by: self.disposeBag)
        
        self.input.onNext("Test")
        self.continueTap.onNext(())
        
        expect(user).toNotEventually(beNil())
        
    }
    
    func test_selectedUser_shouldNOTBeInvoked_whenUserIsNotValid() {
        
        var user: User?
        
        self.viewModel.selectedUser
            .drive(onNext: {
                user = $0
                Nimble.fail("Selected user should not be called")
            }).disposed(by: self.disposeBag)
        
        self.repository.isSuccess = false
        self.input.onNext("Test")
        self.continueTap.onNext(())
    
        
    }
    
}
