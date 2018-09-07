//___FILEHEADER___

import Foundation
import UIKit

class ___VARIABLE_moduleName___View: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "___VARIABLE_moduleName___View"
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        self.backgroundColor = .white
        self.addSubview(label)
        
        self.label.prepareForConstraints()
        
        self.label.centerVertically()
        self.label.centerHorizontally()
    }
    
}
