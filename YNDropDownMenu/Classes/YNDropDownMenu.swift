//
//  YNDropDownMenu.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 18..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNDropDownMenu: UIView, YNDropDownDelegate {
    fileprivate var opened: Bool = false
    fileprivate var openedIndex: Int = 0
    
    fileprivate var dropDownButtons: [YNDropDownButton]?
    fileprivate var menuHeight: CGFloat = 0.0
    fileprivate var numberOfMenu: Int = 0
    
    fileprivate var buttonImages: YNImages?
    fileprivate var buttonlabelFontColors: YNFontColor?
    fileprivate var buttonlabelFonts: YNFont?
    
    fileprivate var _dropDownViews: [UIView]?
    fileprivate var dropDownViews: [UIView]? {
        get {
            return self._dropDownViews
        }
        set {
            guard let _dropDownViews = newValue else { return }
            for view in _dropDownViews {
                if let v = view as? YNDropDownView {
                    v.delegate = self
                }
            }
            self._dropDownViews = newValue
        }
    }
    
    fileprivate var alwaysOnIndex: Int?

    open var blurEffectView: UIView? {
        didSet {
            self.changeBlurEffectView()
        }
    }
    
    open var blurEffectViewAlpha:CGFloat = 1.0
    open var blurEffectStyle:UIBlurEffectStyle = .dark
    
    open var dropDownViewTitles: [String]?

    open var backgroundBlurEnabled = true
    
    open var showMenuDuration = 0.5
    open var hideMenuDuration = 0.3
    
    open var showMenuSpringVelocity:CGFloat = 0.5
    open var showMenuSpringWithDamping:CGFloat = 0.8
    
    open var hideMenuSpringVelocity:CGFloat = 0.9
    open var hideMenuSpringWithDamping:CGFloat = 0.8
    
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
    
    @available(*, deprecated, message: "use init(frame: CGRect, dropDownViews: [UIView], dropDownViewTitles: [String]) instead")
    public init(frame: CGRect, YNDropDownViews: [YNDropDownView], dropDownViewTitles: [String]) {
        super.init(frame: frame)

        if YNDropDownViews.count != dropDownViewTitles.count {
            fatalError("Please make dropDownViews count same with dropDownViewsTitles count")
        } else {
            numberOfMenu = YNDropDownViews.count
        }

        self._dropDownViews = YNDropDownViews
        self.dropDownViewTitles = dropDownViewTitles
        self.menuHeight = self.frame.height

        self.initViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setImageWhen(normal: UIImage?, selected: UIImage?, disabled: UIImage?) {
        self.buttonImages = YNImages.init(normal: normal, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].buttonImages = self.buttonImages
        }
    }
    
    open func setLabelColorWhen(normal: UIColor, selected: UIColor, disabled: UIColor) {
        self.buttonlabelFontColors = YNFontColor.init(normal: normal, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].labelFontColors = self.buttonlabelFontColors
        }
    }
    
    open func setLabelFontWhen(normal: UIFont, selected: UIFont, disabled: UIFont) {
        self.buttonlabelFonts = YNFont.init(normal: normal, selected: selected, disabled: disabled)
        
        for i in 0..<numberOfMenu {
            dropDownButtons?[i].labelFonts = self.buttonlabelFonts
        }

    }
    
    open func alwaysSelectedAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        self.alwaysOnIndex = index
        
        dropDownButtons?[index].buttonLabel.textColor = self.buttonlabelFontColors?.selected
        dropDownButtons?[index].buttonLabel.font = self.buttonlabelFonts?.selected
    }
    
    open func disabledMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        dropDownButtons?[index].disabled()
    }
    
    open func enabledMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        dropDownButtons?[index].enabled()
    }
    
    open func hideMenu() {
        if opened {
            hideMenu(yNDropDownButton: dropDownButtons?[openedIndex], buttonImageView: dropDownButtons?[openedIndex].buttonImageView, dropDownMenu: dropDownViews?[openedIndex], didComplete: nil)
            opened = !opened
        }
    }
    
    open func changeMenuTitleAt(index: Int, title: String) {
        dropDownButtons?[index].buttonLabel.text = title
    }
    
    open func changeViewAt(index: Int, view: UIView) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        
        dropDownViews?[index] = view
        
        view.frame.size = CGSize(width: self.bounds.size.width, height: view.frame.size.height)
        view.frame.origin.y = -view.frame.height + CGFloat(menuHeight)
        view.isHidden = true
        
        self.addSubview(view)
        self.sendSubview(toBack: view)
        
        print("///changeViewAt///")
        print(dropDownViews?[index])
        print("///////")

    }

    open func showAndHideMenuAt(index: Int) {
        if index > numberOfMenu {
            fatalError("index should be smaller than menu count")
        }
        print("///showAndHideMenuAt///")
        print(dropDownViews?[index])
        print("///////")

        if openedIndex != index && opened {
            hideMenu(yNDropDownButton: dropDownButtons?[openedIndex], buttonImageView: dropDownButtons?[openedIndex].buttonImageView, dropDownMenu: dropDownViews?[openedIndex], didComplete: {
                self.showMenu(yNDropDownButton: self.dropDownButtons?[index], buttonImageView: self.dropDownButtons?[index].buttonImageView, dropDownMenu: self.dropDownViews?[index], didComplete: nil)
            })
            openedIndex = index
            return
        }
        
        openedIndex = index
        
        if !opened {
            showMenu(yNDropDownButton: dropDownButtons?[index], buttonImageView: dropDownButtons?[index].buttonImageView, dropDownMenu: dropDownViews?[index], didComplete: nil)
        } else {
            hideMenu(yNDropDownButton: dropDownButtons?[index], buttonImageView: dropDownButtons?[index].buttonImageView, dropDownMenu: dropDownViews?[index], didComplete: nil)

        }

        opened = !opened

    }
    @objc private func menuClicked(_ sender: YNDropDownButton) {
        self.showAndHideMenuAt(index: sender.tag)
    }
    
    @objc private func blurEffectViewClicked(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }

    
    private func showMenu(yNDropDownButton: YNDropDownButton?, buttonImageView: UIImageView?, dropDownMenu: UIView?, didComplete: (()-> Void)?) {
        guard let yNDropDownButton = yNDropDownButton else { return }
        guard let dropDownMenu = dropDownMenu else { return }
        
        dropDownMenu.isHidden = false
        
        if let v = dropDownMenu as? YNDropDownView {
            v.dropDownViewOpened()
        }
        
        if self.backgroundBlurEnabled, let _blurEffectView = blurEffectView {
            self.superview?.addSubview(_blurEffectView)
            self.superview?.insertSubview(_blurEffectView, belowSubview: self)
        }
        UIView.animate(
            withDuration: self.showMenuDuration,
            delay: 0,
            usingSpringWithDamping: self.showMenuSpringWithDamping,
            initialSpringVelocity: self.showMenuSpringVelocity,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                if self.backgroundBlurEnabled {
                    self.blurEffectView?.alpha = self.blurEffectViewAlpha
                }
                self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.frame.width, height: dropDownMenu.frame.height + CGFloat(self.menuHeight))
                if let _buttonImageView = buttonImageView {
                    _buttonImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 1.0, 0.0, 0.0)
                    _buttonImageView.image = self.buttonImages?.selected
                }
                yNDropDownButton.buttonLabel.textColor = self.buttonlabelFontColors?.selected
                yNDropDownButton.buttonLabel.font = self.buttonlabelFonts?.selected
                
        }, completion: { (completion) in
            guard let block = didComplete else { return }
            block()
        })
    }
    
    private func hideMenu(yNDropDownButton: YNDropDownButton?, buttonImageView: UIImageView?, dropDownMenu: UIView?, didComplete: (()-> Void)?) {
        guard let yNDropDownButton = yNDropDownButton else { return }
        guard let dropDownMenu = dropDownMenu else { return }
        
        dropDownMenu.isHidden = true
        
        if let v = dropDownMenu as? YNDropDownView {
            v.dropDownViewClosed()
        }

        UIView.animate(
            withDuration: self.hideMenuDuration,
            delay: 0,
            usingSpringWithDamping: self.hideMenuSpringWithDamping,
            initialSpringVelocity: self.hideMenuSpringVelocity,
            options: [],
            animations: {
                dropDownMenu.frame.origin.y = CGFloat(self.menuHeight)
                if self.backgroundBlurEnabled {
                    self.blurEffectView?.alpha = 0
                }
                self.frame = CGRect(x: 0.0, y: self.frame.origin.y, width: self.frame.width, height: CGFloat(self.menuHeight))
                if let _buttonImageView = buttonImageView {
                    _buttonImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0.0, 0.0, 0.0);
                    _buttonImageView.image = self.buttonImages?.normal
                }
                if self.alwaysOnIndex != yNDropDownButton.tag {
                    yNDropDownButton.buttonLabel.textColor = self.buttonlabelFontColors?.normal
                    yNDropDownButton.buttonLabel.font = self.buttonlabelFonts?.normal
                }

        }, completion: { (completion) in
            if self.backgroundBlurEnabled {
                self.blurEffectView?.removeFromSuperview()
            }
            guard let block = didComplete else { return }
            block()
        })
    }
    
    
    private func changeBlurEffectView() {
        self.blurEffectView?.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: UIScreen.main.bounds.size.height - self.frame.origin.y)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blurEffectViewClicked(_:)))
        self.blurEffectView?.addGestureRecognizer(tapGesture)
        self.blurEffectView?.alpha = 0

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
            if let _dropDownView = dropDownViews?[i] {
                _dropDownView.frame.size = CGSize(width: self.bounds.size.width, height: _dropDownView.frame.height)
                _dropDownView.frame.origin.y = -_dropDownView.frame.height + CGFloat(menuHeight)
                _dropDownView.isHidden = true
                
                self.addSubview(_dropDownView)
                self.sendSubview(toBack: _dropDownView)
            }
        }
        
        let blurEffect = UIBlurEffect(style: blurEffectStyle)
        self.blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.blurEffectView?.alpha = 0
        
        self.blurEffectView?.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: UIScreen.main.bounds.size.height - self.frame.origin.y)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blurEffectViewClicked(_:)))
        self.blurEffectView?.addGestureRecognizer(tapGesture)
    }
}
