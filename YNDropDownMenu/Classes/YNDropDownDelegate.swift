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
    func changeMenuTitleAt(index: Int, title: String)
    func changeViewAt(index: Int, view: UIView)
}
