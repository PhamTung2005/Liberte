//
//  MyCollectionViewCell.swift
//  LiberteProject
//
//  Created by Pham Tung on 10/23/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import UIKit
import Stevia

class MyCollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let price = UILabel()
        price.text = ""
        price.textColor = .black
        price.textAlignment = .center

        return price
    }()
    
    func setupLayout() {
        self.sv(containerView.sv(photoImageView, nameLabel,priceLabel))
        
        self.layout(
        5,
        |-5-containerView-5-|,
        5
        )
        
        containerView.layout(
        0,
        |-0-photoImageView-0-|,
        5,
        |-10-nameLabel-10-| ~ 15,
        5,
        |-10-priceLabel-10-| ~ 15,
        0
        )
     }
    
    var item: Items? {
        didSet {
            if let item = item {
                photoImageView.image = UIImage(named: item.imageName)
                nameLabel.text = item.name
                priceLabel.text = item.price
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
