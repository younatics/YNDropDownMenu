//
//  YNDropDownProtocol.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 23..
//
//

import Foundation

public protocol YNDropDownDelegate: class {
    func hideMenu()
    
    func changeMenu(title: String, at index: Int)
    func changeView(view: UIView, at index: Int)
}
