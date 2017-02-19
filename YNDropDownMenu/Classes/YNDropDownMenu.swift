//
//  YNDropDownMenu.swift
//  YNDropDownMenu
//
//  Created by YiSeungyoun on 2017. 2. 18..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNDropDownMenu: UIView {
    fileprivate var opened: Bool = false
    fileprivate var openedView = UIView()
    fileprivate var openedArrowView = UIView()
    
    fileprivate var menuHeight: CGFloat = 0.0
    
    public var dropDownViews: [UIView]?
    public var dropDownViewTitles: [String]?

    var numberOfMenu: Int = 0
    
    open var showMenuDuration = 0.5
    open var hideMenuDuration = 0.3
    
    open var menuButtonImage: UIImage?
    open var menuLabelFontSize: CGFloat? {
        didSet {
            
        }
    }
    
    public init(frame: CGRect, dropDownViews: [UIView], dropDownViewTitles: [String], menuButtonImage: UIImage) {
        super.init(frame: frame)
        
        if dropDownViews.count != dropDownViewTitles.count {
            fatalError("Please make dropDownViews count same with dropDownViewsTitles count")
        } else {
            numberOfMenu = dropDownViews.count
        }
        
        self.dropDownViews = dropDownViews
        self.dropDownViewTitles = dropDownViewTitles
        self.menuButtonImage = menuButtonImage
        self.menuHeight = self.frame.height
        
        self.initViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func menuClicked(_ sender: UIButton) {
        var arrowView = UIView()
        var dropDownView = UIView()
        
        let subviews = sender.subviews.filter{$0 is UIImageView}
        for menuArrowView in subviews {
            arrowView = menuArrowView
        }
        
        for subview in self.subviews {
            if subview.tag == sender.tag + 100 {
                dropDownView = subview
            }
        }
        
        if openedView != dropDownView && opened {
            hideMenu(arrowView: openedArrowView, dropDownMenu: openedView, didComplete: {
                self.showMenu(arrowView: arrowView, dropDownMenu: dropDownView, didComplete: nil)
            })
            openedArrowView = arrowView
            openedView = dropDownView
            return
        }
        
        openedArrowView = arrowView
        openedView = dropDownView
        
        if !opened {
            showMenu(arrowView: arrowView, dropDownMenu: dropDownView, didComplete: nil)
        } else {
            hideMenu(arrowView: arrowView, dropDownMenu: dropDownView, didComplete: nil)
        }
        opened = !opened
    }
    
    func showMenu(arrowView: UIView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
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
    
    func hideMenu(arrowView: UIView, dropDownMenu: UIView, didComplete: (()-> Void)?) {
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
    
    fileprivate func initViews() {
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor.white
        let eachWidth = self.bounds.size.width / CGFloat(numberOfMenu)
        
        for i in 0..<numberOfMenu {
            
            // Setup button
            let button = UIButton()
            button.tag = i
            button.backgroundColor = UIColor.white
            button.addTarget(self, action: #selector(menuClicked(_:)), for: .touchUpInside)
            button.frame = CGRect(x: eachWidth * CGFloat(i), y: 0.0, width: eachWidth, height: CGFloat(menuHeight))
            
            self.addSubview(button)
            
            let label = UILabel()
            label.text = dropDownViewTitles?[i]
            if let _menuLabelFontSize = menuLabelFontSize {
                label.font = UIFont.systemFont(ofSize: _menuLabelFontSize)
            } else {
                label.font = UIFont.systemFont(ofSize: 12)
            }
            label.translatesAutoresizingMaskIntoConstraints = false
            
            button.addSubview(label)

            if let _menuButtonImage = menuButtonImage {
                let centerXwithOffsetConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: -((_menuButtonImage.size.height+4)/2))
                
                let centerYConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: button, attribute: .centerY, multiplier: 1.0, constant: 0)

                button.addConstraints([centerXwithOffsetConstraint,centerYConstraint])

                let arrowImage = UIImageView()
                arrowImage.image = _menuButtonImage
                arrowImage.tag = i
                arrowImage.translatesAutoresizingMaskIntoConstraints = false
                
                let arrowXContraint = NSLayoutConstraint(item: arrowImage, attribute: .left, relatedBy: .equal, toItem: label, attribute: .right, multiplier: 1.0, constant: 4)
                let arrowYConstraint = NSLayoutConstraint(item: arrowImage, attribute: .centerY, relatedBy: .equal, toItem: label, attribute: .centerY, multiplier: 1.0, constant: 0)
                
                let arrowHeight = NSLayoutConstraint(item: arrowImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _menuButtonImage.size.height)
                let arrowWidth = NSLayoutConstraint(item: arrowImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _menuButtonImage.size.width)
                
                button.addSubview(arrowImage)
                button.addConstraints([arrowXContraint,arrowYConstraint,arrowHeight,arrowWidth])
            }
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
