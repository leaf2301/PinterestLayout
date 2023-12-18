//
//  CollectionViewCell.swift
//  PinterestBasicLayout
//
//  Created by Tran Hieu on 03/12/2023.
//

import UIKit
import SDWebImage
class CollectionViewCell: UICollectionViewCell {
    
    static let id = "UICollectionViewCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var heightConstraints: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 8
//        contentView.clipsToBounds = true
        contentView.addSubview(myImageView)
//        myImageView.backgroundColor = .green
        
        heightConstraints = myImageView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraints.isActive = true
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            myImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let attributes = layoutAttributes as! PinterestLayoutAttributes
        heightConstraints.constant = attributes.photoHeight
    }
    
    public func configure(url: URL) {
        self.myImageView.sd_imageIndicator = SDWebImageActivityIndicator.white
        self.myImageView.startAnimating()

        myImageView.sd_setImage(with: url)
    }
}
