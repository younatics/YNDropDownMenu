//
//  YNDropDownProtocol.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 23..
//
//

import Foundation

protocol YNDropDownDelegate: class {
    func hideMenu()
    
}
class YNDropDownView {
    weak var delegate: YNDropDownDelegate?
    
    func hideMenuInView() {
        self.delegate?.hideMenu()
    }
}
