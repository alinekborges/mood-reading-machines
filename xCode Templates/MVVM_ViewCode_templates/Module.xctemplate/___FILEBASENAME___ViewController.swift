//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(___VARIABLE_moduleName___View.self) { resolver in
        ___VARIABLE_moduleName___View()
    }
 */

class ___VARIABLE_moduleName___ViewController: UIViewController {
    
    var viewModel: ___VARIABLE_moduleName___ViewModel!
    let baseView = ___VARIABLE_moduleName___View()
    
    //weak var delegate: AppActionable?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension ___VARIABLE_moduleName___ViewController {
    
    func setupViewModel() {
        self.viewModel = ___VARIABLE_moduleName___ViewModel()
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
