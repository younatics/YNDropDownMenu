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
    
    
    open func changeMenu(title: String, at index: Int) {
        self.delegate?.changeMenu(title: title, at: index)
    }
    
    open func changeView(view: UIView, at index: Int) {
        self.delegate?.changeView(view: view, at: index)
    }
}
