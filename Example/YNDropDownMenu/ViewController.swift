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
        
        let ZBdropDownViews = Bundle.main.loadNibNamed("ZBDropDownMenu", owner: nil, options: nil) as? [YNDropDownView]
        let FFA409 = UIColor(colorLiteralRed: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)
        
        if let _ZBdropDownViews = ZBdropDownViews {
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 38), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
            view.setImageWhen(normal: UIImage(named: "arrow_nor"), selected: UIImage(named: "arrow_sel"), disabled: UIImage(named: "arrow_dim"))
            view.setLabelColorWhen(normal: UIColor.black, selected: FFA409, disabled: UIColor.gray)
            view.setLabelFontWhen(normal: UIFont.systemFont(ofSize: 12), selected: UIFont.boldSystemFont(ofSize: 12), disabled: UIFont.systemFont(ofSize: 12))
            
            view.backgroundBlurEnabled = false
            
            // Add custom blurEffectView
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.black
            view.blurEffectView = backgroundView
            view.blurEffectViewAlpha = 0.7
            
            // Open and Hide Menu
            view.disabledMenuAt(index: 2)
            //view.showAndHideMenuAt(index: 3)
            self.view.addSubview(view)
        }        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

