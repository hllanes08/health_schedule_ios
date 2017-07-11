//
//  MenuTabViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 10/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController
import SwiftIconFont
import ChameleonFramework

class MenuTabViewController: RAMAnimatedTabBarController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabAnimation = RAMRotationAnimation()
        tabAnimation.textSelectedColor = UIColors.btnColor()
        tabAnimation.iconSelectedColor = UIColors.btnColor()
        
        let tabBarItems = RAMAnimatedTabBarItem(title: "Turnos", image: UIImage.icon(from: .Ionicon, code: "ios-checkmark-outline", imageSize: CGSize(width: 25, height: 25), ofSize: 25), selectedImage: nil)
        tabBarItems.textColor = UIColor.white
        tabBarItems.iconColor =  UIColor.white
        tabBarItems.animation = tabAnimation
        
        let calendarItems = RAMAnimatedTabBarItem(title: "Calendario", image: UIImage.icon(from: .Ionicon, code: "ios-calendar-outline", imageSize: CGSize(width: 25, height: 25), ofSize: 25), selectedImage: nil)
        calendarItems.textColor = UIColor.white
        calendarItems.iconColor = UIColor.white
        calendarItems.animation = tabAnimation
        
        
        let calendarItemsViewController = CalendarItemsViewController()
        let calendarItemsNavViewController = NavViewController(rootViewController: calendarItemsViewController)
        calendarItemsViewController.title = "Cursos"
        calendarItemsViewController.tabBarItem = tabBarItems
        //calendarItemsViewController.navigationItem.leftBarButtonItem = LogoBarButtonItem()
        calendarItemsViewController.navigationController?.navigationBar.isTranslucent = false
        calendarItemsNavViewController.setStatusBarStyle(.lightContent)
        
        let calendarViewController = CalendarViewController()
        let calendarNavViewController = NavViewController(rootViewController: calendarViewController)
        calendarViewController.title = "Calendario"
        calendarViewController.tabBarItem = calendarItems
        //calendarItemsViewController.navigationItem.leftBarButtonItem = LogoBarButtonItem()
        calendarViewController.navigationController?.navigationBar.isTranslucent = false
        calendarNavViewController.setStatusBarStyle(.lightContent)
        
        
        tabBar.barTintColor = UIColor(gradientStyle:UIGradientStyle.radial, withFrame: self.tabBar.frame, andColors:[ UIColors.bgCenterColor(), UIColors.bgColor(), UIColors.shadows()])
        viewControllers = [ calendarItemsViewController, calendarViewController]

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
