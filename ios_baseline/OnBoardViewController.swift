//
//  OnBoardViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 17/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import paper_onboarding

class OnBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let onboarding = PaperOnboarding(itemsCount: 3)
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // add constraints
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
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

extension OnBoardViewController: PaperOnboardingDataSource {
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        return [
            ("BIG_IMAGE1", "Title", "Description text", "IconName1",  UIColor(red:0.61, green:0.56, blue:0.74, alpha:1.00), UIColor.white, UIColor.white, titleFont, descriptionFont),
             ("BIG_IMAGE1", "Title", "Description text", "IconName1",  UIColor(red:0.61, green:0.56, blue:0.74, alpha:1.00), UIColor.white, UIColor.white, titleFont, descriptionFont),
              ("BIG_IMAGE1", "Title", "Description text", "IconName1",  UIColor(red:0.61, green:0.56, blue:0.74, alpha:1.00), UIColor.white, UIColor.white, titleFont, descriptionFont)
            ][index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingConfigurationItem(item: OnboardingContentViewItem, index: Int) {
            
    }
    
}

