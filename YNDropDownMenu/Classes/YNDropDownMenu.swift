//
//  YNDropDownMenu.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 18..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNDropDownMenu: UIView {
    private var opened: Bool = false
    private var openedView = UIView()
    private var openedArrowView = UIView()
    
    private var dropDownButtons: [YNDropDownButton]?
    private var menuHeight: CGFloat = 0.0
    
    public var dropDownViews: [UIView]?
    public var dropDownViewTitles: [String]?

    private var numberOfMenu: Int = 0
    
    open var showMenuDuration = 0.5
    open var hideMenuDuration = 0.3
    
    open var labelFontSize: CGFloat? {
        didSet {
            
        }
    }
    private var buttonImages: YNImages?
    
    public init(frame: CGRect, dropDownViews: [UIView], dropDownViewTitles: [String]) {
        super.init(frame: frame)
        
        if dropDownViews.count != dropDownViewTitles.count {
            fatalError("Please make dropDownViews count same with dropDownViewsTitles count")
        } else {
            numberOfMenu = dropDownViews.count
        }
        
        self.dropDownViews = dropDownViews
        self.dropDownViewTitles = dropDownViewTitles
        self.menuHeight = self.frame.height
        
        self.initViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Use this function when your menu button image is all same
    open func setImageWhen(normal: UIImage?, highlighted: UIImage?, selected: UIImage?, disabled: UIImage?) {
        let yNImages = YNImages.init(normal: normal, highlighted: highlighted, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].buttonImages = yNImages
        }
    }
    
    open func setImageWhen(normal: UIImage?, highlighted: UIImage?, selected: UIImage?, disabled: UIImage?, atIndex: Int) {
        let yNImages = YNImages.init(normal: normal, highlighted: highlighted, selected: selected, disabled: disabled)
        dropDownButtons?[atIndex].buttonImages = yNImages
    }
    
    
    open func setLabelColorWhen(normal: UIColor, highlighted: UIColor, selected: UIColor, disabled: UIColor) {
        let yNFontColor = YNFontColor.init(normal: normal, highlighted: highlighted, selected: selected, disabled: disabled)
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].labelFontColors = yNFontColor
        }
    }
    
    open func setLabelColorAtIndexWhen(normal: UIColor, highlighted: UIColor, selected: UIColor, disabled: UIColor, atIndex: Int) {
        let yNFontColor = YNFontColor.init(normal: normal, highlighted: highlighted, selected: selected, disabled: disabled)
            dropDownButtons?[atIndex].labelFontColors = yNFontColor
    }
    
    open func openMenuAt(index: Int) {
        for subview in self.subviews {

            
        }
    }

    
    @objc private func menuClicked(_ sender: YNDropDownButton) {
        var dropDownView = UIView()
        
        for subview in self.subviews {
            if subview.tag == sender.tag + 100 {
                dropDownView = subview
            }
        }
        if let buttonImageView = sender.buttonImageView {
            if openedView != dropDownView && opened {
                hideMenu(arrowView: openedArrowView, dropDownMenu: openedView, didComplete: {
                    self.showMenu(arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)
                })
                openedArrowView = buttonImageView
                openedView = dropDownView
                return
            }
            
            openedArrowView = buttonImageView
            openedView = dropDownView
            
            if !opened {
                showMenu(arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)
            } else {
                hideMenu(arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)
            }
            opened = !opened
        }
    }
    
    
    private func showMenu(arrowView: UIView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
        dropDownMenu.isHidden = false
        
        UIView.animate(
            withDuration: self.showMenuDuration,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.frame.width, height: dropDownMenu.frame.height + CGFloat(self.menuHeight))
                arrowView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 1.0, 0.0, 0.0);
        }, completion: { (completion) in
            guard let block = didComplete else { return }
            block()
        })
    }
    
    private func hideMenu(arrowView: UIView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
        dropDownMenu.isHidden = true
        
        UIView.animate(
            withDuration: self.hideMenuDuration,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.9,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                self.frame = CGRect(x: 0.0, y: self.frame.origin.y, width: self.frame.width, height: CGFloat(self.menuHeight))
                arrowView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0.0, 0.0, 0.0);
                
        }, completion: { (completion) in
            guard let block = didComplete else { return }
            block()
        })
    }
    
    private func initViews() {
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor.white
        self.dropDownButtons = [YNDropDownButton]()
        
        let eachWidth = self.bounds.size.width / CGFloat(numberOfMenu)
        
        for i in 0..<numberOfMenu {
            // Setup button
            let button = YNDropDownButton(frame: CGRect(x: eachWidth * CGFloat(i), y: 0.0, width: eachWidth, height: CGFloat(menuHeight)), buttonLabelText: dropDownViewTitles?[i])
            button.tag = i
            button.addTarget(self, action: #selector(menuClicked(_:)), for: .touchUpInside)
            
            dropDownButtons?.append(button)
            
            self.addSubview(button)
            
            // Setup Views
            let dropDownMenu = dropDownViews?[i]
            if let _dropDownMenu = dropDownMenu {
                _dropDownMenu.frame.size = CGSize(width: self.bounds.size.width, height: _dropDownMenu.frame.height)
                _dropDownMenu.frame.origin.y = -_dropDownMenu.frame.height + CGFloat(menuHeight)
                _dropDownMenu.tag = i + 100
                _dropDownMenu.isHidden = true
                
                self.addSubview(_dropDownMenu)
                self.sendSubview(toBack: _dropDownMenu)
            }
            
        }
    }

}
