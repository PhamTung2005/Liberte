//
//  UserInfo.swift
//  LiberteProject
//
//  Created by Pham Tung on 10/15/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import UIKit
import Stevia

class UserInfo: UIViewController  {
    
    var avatarImage: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: UIImage(named: "avatar"))
    
    return image
    }()
    
    var cameraButton: UIButton = {
        var camera = UIButton()
        return camera
    }()
    
    var photoButton: UIButton = {
        var photo = UIButton()
        return photo
    }()
    
    var thongTinLabel: UILabel = {
        var thongTin = UILabel()
        return thongTin
    }()
    
    var diaChiLabel: UILabel = {
        var diaChi = UILabel()
        return diaChi
    }()
    
    var donHangLabel: UILabel = {
        var donHang = UILabel()
        return donHang
    }()
    
    var tichDiemLabel: UILabel = {
        var tichDiem = UILabel()
        return tichDiem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    func setupLayout() {
        view.sv(avatarImage, cameraButton, photoButton, thongTinLabel, diaChiLabel, donHangLabel, tichDiemLabel)
        
        view.layout(
        40,
        |-80-avatarImage-80-| ~ 150,
        10,
        |-50-cameraButton-(>=0)-photoButton-50-|,
        30,
        |-30-thongTinLabel-30-|,
        20,
        |-30-diaChiLabel-30-|,
        20,
        |-30-donHangLabel-30-|,
        20,
        |-30-tichDiemLabel-30-|,
        80
        )
    }


}
