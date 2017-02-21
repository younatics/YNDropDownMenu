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
    private var openedArrowView = UIImageView()
    private var openedYNDropDownButton = YNDropDownButton()
    
    private var dropDownButtons: [YNDropDownButton]?
    private var menuHeight: CGFloat = 0.0
    
    public var dropDownViews: [UIView]?
    public var dropDownViewTitles: [String]?

    private var numberOfMenu: Int = 0
    
    open var showMenuDuration = 0.5
    open var hideMenuDuration = 0.3
    
    open var showMenuSpringVelocity:CGFloat = 0.5
    open var showMenuSpringWithDamping:CGFloat = 0.8
    
    open var hideMenuSpringVelocity:CGFloat = 0.9
    open var hideMenuSpringWithDamping:CGFloat = 0.8
    
    open var labelFontSize: CGFloat? {
        didSet {
            
        }
    }
    private var buttonImages: YNImages?
    private var buttonlabelFontColors: YNFontColor?
    
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
    open func setImageWhen(normal: UIImage?, selected: UIImage?, disabled: UIImage?) {
        buttonImages = YNImages.init(normal: normal, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].buttonImages = buttonImages
        }
    }
    
    open func setLabelColorWhen(normal: UIColor, selected: UIColor, disabled: UIColor) {
        buttonlabelFontColors = YNFontColor.init(normal: normal, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].labelFontColors = buttonlabelFontColors
        }
    }
    
    open func disabledMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        for subview in self.subviews {
            if subview.tag == index {
                if subview.isKind(of: YNDropDownButton.self) {
                    let _subview = subview as! YNDropDownButton
                    _subview.disabled()
                }
            }

        }
        
    }
    
    open func enabledMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        for subview in self.subviews {
            if subview.tag == index {
                if subview.isKind(of: YNDropDownButton.self) {
                    let _subview = subview as! YNDropDownButton
                    _subview.enabled()
                }
            }
            
        }
        
    }

    
    open func showAndHideMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        
        var dropDownView = UIView()
        var buttonImageView = UIImageView()
        var yNDropDownButton = YNDropDownButton()

        for subview in self.subviews {
            if subview.tag == index + 100 {
                dropDownView = subview
            }
            
            if subview.tag == index {
                if subview.isKind(of: YNDropDownButton.self) {
                    let _subview = subview as! YNDropDownButton
                    yNDropDownButton = _subview
                    buttonImageView = _subview.buttonImageView
                }
            }
        }
        
        if openedView != dropDownView && opened {
            hideMenu(yNDropDownButton: openedYNDropDownButton, arrowView: openedArrowView, dropDownMenu: openedView, didComplete: {
                self.showMenu(yNDropDownButton: yNDropDownButton, arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)
            })
            openedYNDropDownButton = yNDropDownButton
            openedArrowView = buttonImageView
            openedView = dropDownView
            return
        }
        
        openedYNDropDownButton = yNDropDownButton
        openedArrowView = buttonImageView
        openedView = dropDownView
        
        if !opened {
            showMenu(yNDropDownButton: yNDropDownButton, arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)
        } else {
            hideMenu(yNDropDownButton: yNDropDownButton, arrowView: buttonImageView, dropDownMenu: dropDownView, didComplete: nil)

        }
        opened = !opened

    }
    
    @objc private func menuClicked(_ sender: YNDropDownButton) {
        self.showAndHideMenuAt(index: sender.tag)
    }
    
    private func showMenu(yNDropDownButton: YNDropDownButton, arrowView: UIImageView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
        dropDownMenu.isHidden = false

        UIView.animate(
            withDuration: self.showMenuDuration,
            delay: 0,
            usingSpringWithDamping: self.showMenuSpringWithDamping,
            initialSpringVelocity: self.showMenuSpringVelocity,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.frame.width, height: dropDownMenu.frame.height + CGFloat(self.menuHeight))
                arrowView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 1.0, 0.0, 0.0)
                arrowView.image = self.buttonImages?.selected
                yNDropDownButton.buttonLabel.textColor = self.buttonlabelFontColors?.selected

        }, completion: { (completion) in
            guard let block = didComplete else { return }
            block()
        })
    }
    
    private func hideMenu(yNDropDownButton: YNDropDownButton,arrowView: UIImageView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
        dropDownMenu.isHidden = true
        
        UIView.animate(
            withDuration: self.hideMenuDuration,
            delay: 0,
            usingSpringWithDamping: self.hideMenuSpringWithDamping,
            initialSpringVelocity: self.hideMenuSpringVelocity,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                self.frame = CGRect(x: 0.0, y: self.frame.origin.y, width: self.frame.width, height: CGFloat(self.menuHeight))
                arrowView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0.0, 0.0, 0.0);
                arrowView.image = self.buttonImages?.normal
                yNDropDownButton.buttonLabel.textColor = self.buttonlabelFontColors?.normal

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
