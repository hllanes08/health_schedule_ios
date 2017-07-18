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
import Spring
import ChameleonFramework
import Segmentio
import MBProgressHUD

class CalendarsDetailViewController: UIViewController  {
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
        label.text = "0"
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
    let animationView:SpringImageView = {
        let siv = SpringImageView()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 150,y: 150), radius: CGFloat(50), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor =  UIColors.orangeIntense().cgColor//UIColor(gradientStyle:UIGradientStyle.radial, withFrame: shapeLayer.frame, andColors:[ UIColors.redIntense(), UIColors.orangeIntense(), UIColors.shadows()]).cgColor
        siv.layer.addSublayer(shapeLayer)
        siv.layer.masksToBounds = true
        siv.backgroundColor = .clear
        return siv
    }()
    let footerContent:UIView = {
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
    var asyncCalendar = false
    var animationStatus = false
    var calendarId:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationView.alpha = 0
        
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
        centerContent.addSubview(animationView)
        animationView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    
        
        self.view.addSubview(footerContent)
        footerContent.snp.makeConstraints{ (make) in
            make.height.equalToSuperview().dividedBy(3)
            make.left.right.bottom.equalToSuperview()
        }
        footerContent.addSubview(syncButton)
        syncButton.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        loadingAnimation()
        
        ApiService.sharedInstance.fetchCalendarItems(calendarId: self.calendarId){ (calendarItemsDataSource) in
            self.datasource = calendarItemsDataSource
            self.weekendLabels.text = String(calendarItemsDataSource.numberOfWeekends())
            self.totalLabel.text = String(calendarItemsDataSource.numberOfItems(0))
            self.holidayLabel.text = String(calendarItemsDataSource.numberOfHolidays())
            var appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.calendarEvents.events = calendarItemsDataSource.calendar_items
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        

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
                self.asyncCalendar = true
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
