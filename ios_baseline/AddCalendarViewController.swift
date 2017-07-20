//
//  AddCalendarViewController.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 18/7/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import UIKit
import SnapKit
import DatePickerDialog
import SkyFloatingLabelTextField
import DropDown
import MBProgressHUD

class AddCalendarViewController: UIViewController {

    let nameField: UITextField  = {
        let field = UIComponents.customTextFieldRounded(placeholder: "Nombre", icon: "io:pound", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        return field
    }()
    let dateformater = DateFormatter()

    let startDatePicker:UITextField = {
        let field = UIComponents.customTextFieldRounded(placeholder: "Proximo Turno", icon: "io:calendar", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        field.addTarget(self, action: #selector(showStartDatePicker), for: UIControlEvents.touchDown)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEvents)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEditingEvents)
        return field
    }()
    
    let endDatePicker:UITextField = {
        let field = UIComponents.customTextFieldRounded(placeholder: "Generar Hasta", icon: "io:calendar", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        field.addTarget(self, action: #selector(showEndDatePicker), for: UIControlEvents.touchDown)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEvents)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEditingEvents)

        return field
    }()
    
    let ndayField: UITextField  = {
        let field = UIComponents.customTextFieldRounded(placeholder: "Cada cuantos dias", icon: "io:grid", tntColor: .flatWhite, phColor: UIColors.phColor(), bgColor: UIColors.textbgColor(), lineColor: UIColor.clear, selectedLineColor: UIColor.clear)
        field.addTarget(self, action: #selector(showDropdown), for: UIControlEvents.touchDown)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEvents)
        field.addTarget(self, action: #selector(hideKeyboard), for: UIControlEvents.allEditingEvents)
        return field
    }()
    
    
    let submmitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColors.btnColor()
        button.setTitle("io:ios-plus-outline Generar", for: .normal)
        button.setTitleColor(UIColor.flatWhite, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(generateCalendar), for: .touchUpInside)
        button.parseIcon()
        return button
    }()
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Agregar Calendario"
        dateformater.dateFormat = "yyyy-MM-dd"
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(47)
        }
        
        view.addSubview(startDatePicker)
        
        startDatePicker.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(nameField.snp.bottomMargin).offset(30)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(47)
        }
        
        view.addSubview(endDatePicker)
        
        endDatePicker.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(startDatePicker.snp.bottomMargin).offset(30)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(47)
        }
        
        view.addSubview(ndayField)
        
        ndayField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(endDatePicker.snp.bottomMargin).offset(30)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(47)
        }
        
        view.addSubview(submmitButton)
        
        submmitButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.bottom.equalToSuperview().offset(-100)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(47)
        }
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        /*
         
         */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showStartDatePicker(sender: SkyFloatingLabelTextFieldWithIcon){
        hideKeyboard()
        let dp = DatePickerDialog()
        dp.show(title: "Proximo Turno", doneButtonTitle: "Ok", cancelButtonTitle: "Cancelar", defaultDate: Date() , minimumDate: nil, maximumDate: nil, datePickerMode: UIDatePickerMode.date, callback: { (date) -> Void in
            if (date != nil){
            self.startDatePicker.text = self.dateformater.string(from: date!)
            self.hideKeyboard()
            }
        })
    }
    
    func showEndDatePicker(sender: SkyFloatingLabelTextFieldWithIcon){
        hideKeyboard()
        let dp = DatePickerDialog()
        dp.show(title: "Proximo Turno", doneButtonTitle: "Ok", cancelButtonTitle: "Cancelar", defaultDate: Date() , minimumDate: nil, maximumDate: nil, datePickerMode: UIDatePickerMode.date, callback: { (date) -> Void in
            if (date != nil){
                self.endDatePicker.text = self.dateformater.string(from: date!)
                self.hideKeyboard()
            }
        })
    }

    func showDropdown(){
        dropDown.dataSource = ["1", "2", "3","4","5","6"]
        dropDown.anchorView =  ndayField.inputView
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.cellHeight * 3))
        dropDown.width = (view.frame.size.width - 100)
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.ndayField.text = item
        }

    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    func generateCalendar(){
        let name = nameField.text!
        let start_date = startDatePicker.text!
        let end_date = endDatePicker.text!
        let ndays = ndayField.text!
        loadingAnimation()
        ApiService.sharedInstance.addCalendar(name: name, startDate: start_date, endDate: end_date, ndays: ndays, completion: { (result) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if(result){
                self.navigationController?.popViewController(animated: true)
            }
            
        })
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
