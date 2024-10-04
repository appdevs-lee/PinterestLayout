//
//  ImageCollectionViewCell.swift
//  PinterestLayout
//
//  Created by Awesomepia on 10/4/24.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setSubviews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension for essential methods
extension ImageCollectionViewCell: EssentialCellHeaderMethods {
    func setViewFoundation() {
        self.backgroundColor = .white
    }
    
    func initializeObjects() {
        
    }
    
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.imageView,
        ], to: self)
    }
    
    func setLayouts() {
        //let safeArea = self.safeAreaLayoutGuide
        
        // imageView
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
}

// MARK: - Extension for methods added
extension ImageCollectionViewCell {
    func setCell(name: String) {
        self.imageView.image = .useCustomImage(name)
        
    }
}

