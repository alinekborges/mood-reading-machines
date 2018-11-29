//
//  CloudTagView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CloudTagView: UIView {
    
    var items: [String] = [] {
        didSet {
            self.observableItems.onNext(items)
        }
    }
    
    private let observableItems = PublishSubject<[String]>()
    
    private var tagHeight: CGFloat = 36
    
    var tagBackgroundColor: UIColor = UIColor.white.withAlphaComponent(0.4)
    
    var textColor: UIColor = .black
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.setupViews()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    func configure(tagHeight: CGFloat, tagBackgroundColor: UIColor, textColor: UIColor) {
        self.tagHeight = tagHeight
        self.tagBackgroundColor = tagBackgroundColor
        self.textColor = textColor
        self.collectionView.reloadData()
    }
    
    private func setupViews() {
        self.addSubview(self.collectionView)
        self.collectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
        self.setupBindinds()
        self.collectionView.delegate = self
        collectionView.allowsSelection = true
        self.collectionView.prepareForConstraints()
        self.collectionView.pinEdgesToSuperview()
        self.backgroundColor = .clear
        self.collectionView.backgroundColor = .clear
        self.accessibilityIdentifier = "cloudTagView"
    }
    
    private func setupBindinds() {
        observableItems
            .asObservable()
            .bind(to: collectionView.rx
                .items(cellIdentifier: "TagCell",
                       cellType: TagCell.self)) { _, element, cell in
                        cell.bind(element, backgroundColor: self.tagBackgroundColor, textColor: self.textColor)
            }.disposed(by: rx.disposeBag)
    }
    
}

extension CloudTagView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = self.items[indexPath.row]
        let width = item.width(usingFont: TagCell.font) + 16
        return CGSize(width: width, height: self.tagHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.2, delay: (0.02 * Double(indexPath.row)), options: .curveLinear, animations: {
            cell.alpha = 1.0
        }, completion: nil)
    }
    
}

class TagCell: UICollectionViewCell {
    
    static var font: UIFont = UIFont.boldSystemFont(ofSize: 16)
    
    let titleLabel = UILabel()
    
    var didSetupConstraints = false
    
    func bind(_ string: String, backgroundColor: UIColor, textColor: UIColor) {
        self.titleLabel.text = string
        self.accessibilityIdentifier = string
        self.titleLabel.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.font = TagCell.font
        self.titleLabel.textAlignment = .center
        self.layer.cornerRadius = 6.0
        self.setupConstraints()
        self.layoutIfNeeded()
    }
    
    func setupConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            self.addSubview(titleLabel)
            self.titleLabel.prepareForConstraints()
            self.titleLabel.pinTop()
            self.titleLabel.pinBottom()
            self.titleLabel.pinLeft(0)
            self.titleLabel.pinRight(0)
        }
    }
    
}

//https://stackoverflow.com/questions/1324379/
//how-to-calculate-the-width-of-a-text-string-of-a-specific-font-and-font-size
extension String {
    
    func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func height(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func size(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedStringKey.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
