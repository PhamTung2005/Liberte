//
//  ListViewController.swift
//  LiberteProject
//
//  Created by Pham Tung on 9/24/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import UIKit
import Stevia

class ListViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        
        return collectionView
    }()
    
    var items = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupData()
        setupLayout()
        
    }
    
    func setupLayout() {
        view.sv(collectionView)
        view.layout(
        50,
        |-10-collectionView-10-|,
        30
        )
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }
    
    func setupData() {
        let item1 = Items(imageName: "party1", name: "Váy đính", price: "790.000 đ")
        let item2 = Items(imageName: "party2", name: "Váy đính 2", price: "690.000 đ")
        let item3 = Items(imageName: "party3", name: "Váy đính 3", price: "890.000 đ")
        let item4 = Items(imageName: "party4", name: "Váy đính 4", price: "990.000 đ")
        let item5 = Items(imageName: "party5", name: "Váy đính 5", price: "790.000 đ")
        let item6 = Items(imageName: "party6", name: "Váy đính 6", price: "590.000 đ")
        
        items = [item1, item2, item3, item4, item5, item6]
    }


}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.item = items[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ((collectionView.frame.size.width - 1) / 2)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        print(item.name)
    }
    
   
}
