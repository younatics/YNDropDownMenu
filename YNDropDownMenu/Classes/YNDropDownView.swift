//
//  YNDropDownView.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 27..
//
//

import Foundation

open class YNDropDownView: UIView {
    open weak var delegate: YNDropDownDelegate?
    
    open func dropDownViewOpened() { }
    open func dropDownViewClosed() { }
    
    open func hideMenu() {
        self.delegate?.hideMenu()
    }
    
    open func changeMenuTitleAt(index: Int, title: String) {
        self.delegate?.changeMenuTitleAt(index: index, title: title)
    }
}
