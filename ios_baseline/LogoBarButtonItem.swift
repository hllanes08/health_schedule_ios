//
//  LogBarButtonItemViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 10/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//
import UIKit

class LogoBarButtonItem: UIBarButtonItem {
    override init() {
        super.init()
        let logoImage = #imageLiteral(resourceName: "logo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        logoImageView.contentMode = .scaleAspectFit
        customView = logoImageView
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
