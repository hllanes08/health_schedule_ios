//
//  UIComponents.swift
//  ios_baseline
//
//  Created by Harvin Llanes on 22/6/17.
//  Copyright © 2017 Harvin Llanes. All rights reserved.
//

import Foundation
import SkyFloatingLabelTextField

class UIComponents{

    static func  customTextField(placeholder:String, icon: String, tntColor: UIColor, phColor: UIColor, bgColor:UIColor) -> SkyFloatingLabelTextFieldWithIcon  {
        let field = SkyFloatingLabelTextFieldWithIcon()
        field.placeholder = placeholder
        field.iconText = icon
        field.iconLabel.parseIcon()
        field.placeholderColor = phColor
        field.tintColor = tntColor
        field.textColor = tntColor
        field.lineColor = bgColor
        field.iconColor = .flatWhite
        field.selectedLineColor = bgColor
        // field.selectedIconColor = .flatWhiteDark
        field.backgroundColor = bgColor
        field.title = ""
        return field
    }
    
    static func customTextFieldRounded(placeholder:String, icon: String, tntColor: UIColor, phColor: UIColor, bgColor:UIColor) -> SkyFloatingLabelTextFieldWithIcon  {
        let field = customTextField(placeholder: placeholder,icon: icon, tntColor: tntColor, phColor: phColor, bgColor:bgColor)
        field.layer.cornerRadius = 15.0
        return field
    }
    static func customTextFieldCorners(placeholder:String, icon: String, tntColor: UIColor, phColor: UIColor, bgColor:UIColor, corners: UIRectCorner) ->SkyFloatingLabelTextFieldWithIcon  {
        let field = customTextField(placeholder: placeholder,icon: icon, tntColor: tntColor, phColor: phColor, bgColor:bgColor)
       // field = roundCorners(field: field, corners: corners, radius: 15)
        
        return field
    }    
    
}
