//
//  YNDropDownView.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 27..
//
//

import UIKit

/// Inherit this class to customize functions
open class YNDropDownView: UIView {
    /// YNDropDownDelegate for call back
    open weak var delegate: YNDropDownDelegate?
    
    /// Override this method if you want to get call back opened
    open func dropDownViewOpened() { }
    
    /// Override this method if you want to get call back closed
    open func dropDownViewClosed() { }
    
    /// hide menu self
    open func hideMenu() {
        self.delegate?.hideMenu()
    }
    
    /**
     Change menu title you called. you can call it in YNDropDownMenu or YNDropDownView
     
     - Parameter title: String
     - Parameter index: Index should be smaller than your menu counts
     */
    open func changeMenu(title: String, at index: Int) {
        self.delegate?.changeMenu(title: title, at: index)
    }
    
    /**
     Change menu title you called. you can call it in YNDropDownMenu or YNDropDownView
     
     - Parameter title: String
     - Parameter status: normal, selected, disabled
     - Parameter index: Index should be smaller than your menu counts
     */
    open func changeMenu(title: String, status: YNStatus, at index: Int) {
        self.delegate?.changeMenu(title: title, status: status, at: index)
    }

    
    /**
     Change view you called. you can call it in YNDropDownMenu or YNDropDownView
     
     - Parameter view: View you want to change
     - Parameter index: Index should be smaller than your menu counts
     */
    open func changeView(view: UIView, at index: Int) {
        self.delegate?.changeView(view: view, at: index)
    }
    
    /**
     Make button label always selected. (not button image)
     
     - Parameter index: Index should be smaller than your menu counts
     */
    open func alwaysSelected(at index: Int) {
        self.delegate?.alwaysSelected(at: index)
    }
    
    /**
     Make button label normal that selected before. (not button image)
     
     - Parameter index: Index should be smaller than your menu counts
     */
    open func normalSelected(at index: Int) {
        self.delegate?.normalSelected(at: index)
    }

}
