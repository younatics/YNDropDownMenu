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
        let image = UIImage(named: "arrow_nor")
        
        if let _ZBdropDownViews = ZBdropDownViews, let _image = image {
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 38), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["매매", "전체가격", "전체면적", "단지특징"],menuButtonImage: _image)
            view.menuLabelFontSize = 20
            
            self.view.addSubview(view)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

