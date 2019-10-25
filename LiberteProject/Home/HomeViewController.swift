//
//  HomeViewController.swift
//  LiberteProject
//
//  Created by Pham Tung on 9/24/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import UIKit
import Stevia

class HomeViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let saleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sale up to 40%"
        label.textAlignment = .center
        return label
    }()
    
    var partyHardImage: UIImageView = {
        var img = UIImageView()
        img = UIImageView(image: UIImage(named: "PartyHard"))
        return img
    }()
    
    let partyLabel: UILabel = {
        let label = UILabel()
        label.text = "PARTYHARD // WINTER 18"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    var aoDaiImage: UIImageView = {
        var img = UIImageView()
        img = UIImageView(image: UIImage(named: "aodai"))
        
        return img
    }()
    
    let aoDaiLabel: UILabel = {
        let label = UILabel()
        label.text = "ÁO DÀI//SPRING 2019"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    var madeImage: UIImageView = {
        var img = UIImageView()
        img = UIImageView(image: UIImage(named: "made"))
        
        return img
    }()
    
    let madeLabel: UILabel = {
        let label = UILabel()
        label.text = "MADEMOISELLE // PRE FALL 18"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Liberte"
        
        setupLayout()
    }
    
    func setupLayout() {
        view.sv(scrollView.sv(contentView.sv(saleLabel, partyHardImage, partyLabel, aoDaiImage, aoDaiLabel, madeImage, madeLabel)))
        view.layout(
            0,
            |-0-scrollView-0-|,
            0
        )
        
        scrollView.layout(
            8,
            |-0-contentView.height(3000)-0-|,
            8
        )
        
        let widthImage = UIScreen.main.bounds.size.width
        contentView.layout(
            0,
            |-8-saleLabel-8-|,
            10,
            |-10-partyHardImage.height(500).width(widthImage-20)-10-|,
            5,
            |-10-partyLabel-10-|,
            30,
            |-50-aoDaiImage.height(500).width(widthImage-100)-50-|,
            5,
            |-10-aoDaiLabel-10-|,
            30,
            |-50-madeImage.height(500).width(widthImage-100)-50-|,
            5,
            |-10-madeLabel-10-|
        )
        
        
    }
}
