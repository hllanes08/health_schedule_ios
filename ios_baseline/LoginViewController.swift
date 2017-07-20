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
import Spring
import MBProgressHUD

class LoginViewController: UIViewController {

   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        let field = UIComponents.customTextFieldRounded(placeholder: "email", icon: "io:person", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        
        return field
    }()
    
    let passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let field = UIComponents.customTextFieldRounded(placeholder: "Contraseña", icon: "io:unlocked", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        field.isSecureTextEntry = true
        return field
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = #imageLiteral(resourceName: "logo-screen")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColors.btnColor()
        button.setTitle("io:log-in Entrar", for: .normal)
        button.setTitleColor(UIColor.flatWhite, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.parseIcon()
        return button
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColors.bgColor()
        //self.view.addSubview(logoImageView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        
        //logoImageView.snp.makeConstraints { (make) in
          //make.top.equalTo(self.view).offset(50)
          // make.centerX.equalTo(self.view)
          //  make.height.width.equalTo(100)
        //}
        
        emailTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.centerY.equalTo(self.view).offset(-50)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func login() {
        let email:String! = emailTextField.text
        let password:String! = passwordTextField.text
        loadingAnimation()
        ApiService.sharedInstance.signIn(email: email, password: password){ (loginResponse) in
            if(loginResponse.success){
                let vc = MenuTabViewController()
                self.present(vc, animated: true, completion: nil)
            }else{
                 MBProgressHUD.hide(for: self.view, animated: true)
                let alert = UIAlertController(title: "Login", message: loginResponse.errors, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    func dismissKeyboard() {
     view.endEditing(true)
    }
    
    func loadingAnimation(){
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.async {
                MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
           
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
