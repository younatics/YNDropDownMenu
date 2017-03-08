//
//  ZBDropDownMenu.swift
//  zigbang_ios
//
//  Created by YiSeungyoun on 2017. 2. 13..
//  Copyright © 2017년 chbreeze. All rights reserved.
//

import UIKit

class ZBFilterMemeView: YNDropDownView {
    @IBOutlet var tradeTypeSegmentControl: UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.normalSelected(at: 1)
        self.hideMenu()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
//        self.changeMenu(title: "Changed", at: 1)
//        self.changeMenu(title: "Changed", status: .selected, at: 0)
        self.alwaysSelected(at: 1)
//        self.alwaysSelected(at: 2)
//        self.alwaysSelected(at: 3)
        self.hideMenu()

    }
    
    override func dropDownViewOpened() {
        print("dropDownViewOpened")
    }
    
    override func dropDownViewClosed() {
        print("dropDownViewClosed")
    }

    func initViews() {
        
    }

}

class ZBFilterSalesPriceVIew: YNDropDownView {
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceSlider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        let ZBdropDownViews = Bundle.main.loadNibNamed("DropDownViews", owner: nil, options: nil) as? [UIView]
        self.changeView(view: (ZBdropDownViews?[0])!, at: 3)
        self.hideMenu()
    }
    
    
    func initViews() {
    }
}

class ZBFilterDepositPriceView: YNDropDownView {
    @IBOutlet var depositLabel: UILabel!
    @IBOutlet var depositSlider: UISlider!
    @IBOutlet var monthlyFeeLabel: UILabel!
    @IBOutlet var monthlyFeeSlider: UISlider!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    
    @IBAction func onlyJeonseButtonClicked(_ sender: Any) {
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    func initViews() {
        
    }

}

class ZBFilterFeatureView: YNDropDownView {
    @IBOutlet var builtDateSegmentControl: UISegmentedControl!
    @IBOutlet var householdsSegmentControl: UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
        
    }
    func initViews() {
    }


}
