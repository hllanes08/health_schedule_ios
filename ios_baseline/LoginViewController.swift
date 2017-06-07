//
//  LoginViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 6/6/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwiftIconFont
import ChameleonFramework
import SnapKit

class LoginViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    let emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        let field = SkyFloatingLabelTextFieldWithIcon()
        field.placeholder = "email"
        field.iconText = "io:person"
        field.iconLabel.parseIcon()
        field.placeholderColor = .flatWhite
        field.tintColor = .flatWhite
        field.textColor = .flatWhite
        field.lineColor = .flatWhite
        field.iconColor = .flatWhite
        field.titleLabel.textColor = .flatWhite
        field.selectedLineColor = .flatWhiteDark
        field.selectedIconColor = .flatWhiteDark
        return field
    }()
    
    let passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let field = SkyFloatingLabelTextFieldWithIcon()
        field.placeholder = "contraseña"
        field.iconText = "io:lock-combination"
        field.isSecureTextEntry = true
        field.iconLabel.parseIcon()
        field.placeholderColor = .flatWhite
        field.tintColor = .flatWhite
        field.textColor = .flatWhite
        field.lineColor = .flatWhite
        field.iconColor = .flatWhite
        field.titleLabel.textColor = .flatWhite
        field.selectedLineColor = .flatWhiteDark
        field.selectedIconColor = .flatWhiteDark
        return field
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = #imageLiteral(resourceName: "logo-screen")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(logoImageView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.top.equalTo(emailTextField.snp.bottom)
            make.height.equalTo(50)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
