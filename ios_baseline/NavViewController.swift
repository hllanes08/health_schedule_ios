//
//  NavViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 10/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import ChameleonFramework

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColors.bgAppColor()
        hidesNavigationBarHairline = false
        navigationBar.tintColor = UIColor.white
        navigationBar.isTranslucent = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
