//
//  CalendarsViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 14/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import LBTAComponents
import ChameleonFramework
import MBProgressHUD

class CalendarsViewController: DatasourceController {

    let refreshControl:UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(fetchCalendars), for: UIControlEvents.allEvents)
        return rc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimation()
        fetchCalendars()
        collectionView?.backgroundColor =  UIColors.bgColor()//UIColor(gradientStyle:UIGradientStyle.radial, withFrame: self.view.frame, andColors:[ UIColors.bgCenterColor(), UIColors.bgColor(), UIColors.shadows()])
        collectionView?.addSubview(refreshControl)
        let rightButtonItem = UIBarButtonItem(
            title: String.fontIonIcon("ios-plus-outline"),
            style: .done,
            target: self,
            action: #selector(addCalendar)
        )
        rightButtonItem.setTitleTextAttributes([NSFontAttributeName: UIFont.icon(from: .Ionicon, ofSize: 17.0)], for: .normal)
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchCalendars(){
        ApiService.sharedInstance.fetchCalendars(completion: { (calendarsDataSource) in
            self.datasource = calendarsDataSource
            MBProgressHUD.hide(for: self.view, animated: true)
            self.refreshControl.endRefreshing()
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
   
    func addCalendar(sender: UIBarButtonItem){
        let vc = AddCalendarViewController()
        navigationController?.pushViewController(vc, animated: true)
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
