//
//  ZBDropDownMenu.swift
//  zigbang_ios
//
//  Created by YiSeungyoun on 2017. 2. 13..
//  Copyright © 2017년 chbreeze. All rights reserved.
//

import UIKit

class ZBFilterMemeView: UIView {
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
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
    }
    
    func initViews() {
        
    }

}

class ZBFilterSalesPriceVIew: UIView {
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
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
    }
    
    
    func initViews() {
    }
}

class ZBFilterDepositPriceView: UIView {
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
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    func initViews() {
        
    }

}

class ZBFilterAreaView: UIView {
    @IBOutlet var areaTableView: UITableView!
    
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
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    func initViews() {
        
    }
}

class ZBFilterFeatureView: UIView {
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
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
    }
    func initViews() {
    }


}
