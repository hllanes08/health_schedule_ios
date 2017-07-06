//
//  DashboardViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 28/6/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import SwiftIconFont
import LBTAComponents
import EventKit

class DashboardViewController: UIViewController {
    var datasource:Datasource = {
        return Datasource()
    }()
    
    let topNumber:UIView = {
        let uv = UIView()
        uv.layer.masksToBounds = true
        uv.backgroundColor = .clear
        return uv
    }()
    
    let weekendsViews: UIView = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.layer.masksToBounds = true
        return uv
    }()
    let totalViews: UIView  = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.layer.masksToBounds = true
        return uv
    }()
    let holidaysViews: UIView = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.layer.masksToBounds = true
        return uv
    }()
    let weekendLabels: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColor.flatWhite
        label.textAlignment = .left
        label.text = "0"
        label.font =  UIFont(name: label.font.fontName, size: 44)
        return label
    }()
    let weekendLabelText: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 13)
        label.text = "Fines"
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 44)
        label.text = "0"
        return label
    }()
    
    let totalLabelText: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 13)
        label.text = "Turnos"
        return label
    }()
    
    let holidayLabel: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 44)
        label.text = "13"
        return label
    }()
    
    let holidayLabelText: UILabel = {
        let label = UILabel()
        //label.font = Styles.Fonts.listOtherFont
        label.textColor = UIColors.lbColor()
        label.textAlignment = .center
        label.font =  UIFont(name: label.font.fontName, size: 13)
        label.text = "Feriados"
        return label

    }()
    
    let centerContent:UIView = {
        let uv = UIView()
        uv.layer.masksToBounds = true
        uv.backgroundColor = .clear
        return uv
    }()
    
    let syncButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColors.btnColor()
        button.setTitle("io:calendar Sincronizar ", for: .normal)
        button.setTitleColor(UIColor.flatWhite, for: .normal)
        button.layer.cornerRadius = 5
         button.addTarget(self, action: #selector(addEventsToCalendar), for: .touchUpInside)
        button.parseIcon()
        return button
    }()
    let eventStore = EKEventStore()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(topNumber)
        topNumber.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(20)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3)
        }
   
        topNumber.addSubview(weekendsViews)
        weekendsViews.snp.makeConstraints{ (make) in
            make.left.equalTo(topNumber)
            make.top.equalTo(topNumber)
            make.top.equalTo(topNumber)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview()
        }
        
        weekendsViews.addSubview(weekendLabels)
        
        weekendLabels.snp.makeConstraints{ (make) in
          make.centerX.equalToSuperview()
          make.centerY.equalToSuperview()
          make.width.equalToSuperview().dividedBy(2)
          make.height.equalToSuperview().dividedBy(2)
        }
        
        weekendsViews.addSubview(weekendLabelText)
        weekendLabelText.snp.makeConstraints{ (make) in
            make.top.equalTo(weekendLabels).offset(20)
            make.left.right.bottom.equalTo(weekendsViews)
        }
        
        topNumber.addSubview(totalViews)
        totalViews.snp.makeConstraints{ (make) in
            make.centerX.centerY.equalToSuperview()
            make.top.bottom.equalTo(topNumber)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview()

        }
        topNumber.addSubview(totalLabel)
        
        totalLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        topNumber.addSubview(totalLabelText)
        totalLabelText.snp.makeConstraints{ (make) in
            make.top.equalTo(totalLabel).offset(20)
            make.left.right.bottom.equalTo(totalViews)
        }
        
        topNumber.addSubview(holidaysViews)
        holidaysViews.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.top.bottom.right.equalTo(topNumber)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview()
            
        }
        holidaysViews.addSubview(holidayLabel)
        holidayLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview().dividedBy(2)
        }
        holidaysViews.addSubview(holidayLabelText)
        holidayLabelText.snp.makeConstraints{ (make) in
            make.top.equalTo(holidayLabel).offset(20)
            make.left.right.bottom.equalTo(holidaysViews)
        }
        self.view.addSubview(centerContent)
        centerContent.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3)
        }
        centerContent.addSubview(syncButton)
        syncButton.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview().dividedBy(2)
        }
        ApiService.sharedInstance.fetchCalendarItems{ (calendarItemsDataSource) in
            self.datasource = calendarItemsDataSource
            self.weekendLabels.text = String(calendarItemsDataSource.numberOfWeekends())
            self.totalLabel.text = String(calendarItemsDataSource.numberOfItems(0))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func addEventsToCalendar(){
        eventStore.requestAccess(to: EKEntityType.event, completion: { (granted, error) in
             if (granted) && (error == nil) {
                let events_calendar = self.addCalendar()
                for index in 0..<self.datasource.numberOfItems(0) {
                    let item  = self.datasource.item(IndexPath(item: index, section: 0)) as! CalendarItem
                    let event:EKEvent = EKEvent(eventStore: self.eventStore)
                    event.title = "Turno"
                    event.startDate = item.start_event_date
                    event.endDate = item.end_event_date
                    event.notes = "Nota Agregada"
                    event.calendar = events_calendar
                    do {
                        try self.eventStore.save(event, span: .thisEvent, commit: true)
                    }catch let error as NSError {
                        print("failed to save event with error : \(error)")
                    }
                }
                
            }
            else{
                print("Error de Acceso")
            }
      })
    }
    
    func addCalendar() ->  EKCalendar {
        let turnosCalendar = EKCalendar(for: EKEntityType.event, eventStore: eventStore)
        turnosCalendar.title = "Turnos"
        let sourcesInEventStore = self.eventStore.sources
        turnosCalendar.source =  sourcesInEventStore.filter{
            (source: EKSource) -> Bool in
            source.sourceType.rawValue == EKSourceType.local.rawValue
            }.first!
        do{
            try self.eventStore.saveCalendar(turnosCalendar, commit: true)
        }
        catch { }
        return turnosCalendar
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
