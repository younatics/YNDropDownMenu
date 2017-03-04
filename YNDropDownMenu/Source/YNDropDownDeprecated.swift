//
//  YNDropDownDeprecated.swift
//  Pods
//
//  Created by YiSeungyoun on 2017. 3. 1..
//
//

import Foundation

extension YNDropDownMenu {
    /// Deprecated use alwaysSelected(at index: Int) instead
    @available(*, deprecated, message: "use alwaysSelected(at index: Int) instead")
    open func alwaysSelectedAt(index: Int) {
        self.alwaysSelected(at: index)
    }
    
    /// Deprecated use disabledMenu(at index: Int) instead
    @available(*, deprecated, message: "use disabledMenu(at index: Int) instead")
    open func disabledMenuAt(index: Int) {
        self.disabledMenu(at: index)
    }
    
    /// Deprecated use enabledMenu(at index: Int) instead
    @available(*, deprecated, message: "use enabledMenu(at index: Int) instead")
    open func enabledMenuAt(index: Int) {
        self.enabledMenu(at: index)
    }
    
    /// Deprecated use showAndHideMenu(at index: Int) instead
    @available(*, deprecated, message: "use showAndHideMenu(at index: Int) instead")
    open func showAndHideMenuAt(index: Int) {
        self.showAndHideMenu(at: index)
    }
}

extension YNDropDownView {
    /// Deprecated use changeMenu(title: String, at index: Int) instead
    @available(*, deprecated, message: "use changeMenu(title: String, at index: Int) instead")
    open func changeMenuTitleAt(index: Int, title: String) {
        self.delegate?.changeMenu(title: title, at: index)
    }
    
}
