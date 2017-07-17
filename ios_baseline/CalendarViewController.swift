//
//  CalendarViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 10/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import FSCalendar
import SnapKit

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance  {
    
    let titleView: UIView  = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.layer.masksToBounds = true
        return uv
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 18)
        label.text = "Calendario de Turnos"
        return label

    }()
    fileprivate weak var calendar: FSCalendar!
    
    let calendarView: UIView  = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.layer.masksToBounds = true
        return uv
    }()
    
    let formatter = DateFormatter()
    var eventsDates  = [String]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints{ (make) in
            make.top.equalToSuperview()
            make.left.bottom.right.equalToSuperview()
        }
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = .clear
        calendar.calendarHeaderView.tintColor = UIColor.white
        calendarView.addSubview(calendar)
        self.calendar = calendar
        self.calendar.reloadData()
        calendar.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.2)
        }
        loadEvents()
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.reloadOnClick(_:)))
        self.view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        if(eventsDates.contains(formatter.string(from: date))){
            return UIColors.greenStrong()
        }
        return nil
    }
    
    func reloadOnClick(_ sender:UITapGestureRecognizer){
        loadEvents()
        self.calendar.reloadData()
    }
    
    func loadEvents(){
        formatter.dateFormat = "yyyy-MM-dd"
        for date in (appDelegate.calendarEvents.events.map{ $0.start_event_date }) {
            eventsDates.append(formatter.string(from: date))
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
