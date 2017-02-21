//
//  ViewController.swift
//  YNDropDownMenu
//
//  Created by seungyoun@zigbang.com on 02/19/2017.
//  Copyright (c) 2017 seungyoun@zigbang.com. All rights reserved.
//

import UIKit
import YNDropDownMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ZBdropDownViews = Bundle.main.loadNibNamed("ZBDropDownMenu", owner: nil, options: nil) as? [UIView]
        
        if let _ZBdropDownViews = ZBdropDownViews {
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 38), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
//            view.menuLabelFontSize = 20
            view.setImageWhen(normal: UIImage(named: "arrow_nor"), highlighted: UIImage(named: "arrow_sel"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
            
            self.view.addSubview(view)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

