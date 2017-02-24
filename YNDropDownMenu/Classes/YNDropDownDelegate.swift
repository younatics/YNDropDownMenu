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
}
open class YNDropDownView: UIView {
    open weak var delegate: YNDropDownDelegate?
    
    open func hideMenu() {
        self.delegate?.hideMenu()
    }
}
