//
//  CalendarsViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 14/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import LBTAComponents
import ChameleonFramework

class CalendarsViewController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCalendars()
        collectionView?.backgroundColor =  UIColors.bgColor()//UIColor(gradientStyle:UIGradientStyle.radial, withFrame: self.view.frame, andColors:[ UIColors.bgCenterColor(), UIColors.bgColor(), UIColors.shadows()])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchCalendars(){
        ApiService.sharedInstance.fetchCalendars(completion: { (calendarsDataSource) in
            self.datasource = calendarsDataSource
        })
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 118)
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CalendarsDetailViewController()
        let data = self.datasource as! CalendarsDataSource
        vc.calendarId = data.calendars[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
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
