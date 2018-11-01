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
        
        let ZBdropDownViews = Bundle.main.loadNibNamed("DropDownViews", owner: nil, options: nil) as? [UIView]
        let FFA409 = UIColor.init(red: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)

        if let _ZBdropDownViews = ZBdropDownViews {
            // Inherit YNDropDownView if you want to hideMenu in your dropDownViews
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 38), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Apple", "Banana", "Kiwi", "Pear"])
            
            let normalImages = [UIImage(named: "HOME_BOX_NORMAL"),
                                UIImage(named: "HOME_COLOR_NORMAL"),
                                UIImage(named: "HOME_DESIGN_NORMAL"),
                                UIImage(named: "HOME_CONCEPT_NORMAL")]
            
            let selectedImages = [imageMaskingwithColor(hexStringToUIColor(hex: "FFA409"), image: UIImage(named: "HOME_BOX_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "FFA409"), image: UIImage(named: "HOME_COLOR_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "FFA409"), image: UIImage(named: "HOME_DESIGN_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "FFA409"), image: UIImage(named: "HOME_CONCEPT_NORMAL"))]
            
            let disabledImages = [imageMaskingwithColor(hexStringToUIColor(hex: "D3D3D3"), image: UIImage(named: "HOME_BOX_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "D3D3D3"), image: UIImage(named: "HOME_COLOR_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "D3D3D3"), image: UIImage(named: "HOME_DESIGN_NORMAL")),
                                  imageMaskingwithColor(hexStringToUIColor(hex: "D3D3D3"), image: UIImage(named: "HOME_CONCEPT_NORMAL"))]
            view.setStatesImages(normalImages: normalImages, selectedImages: selectedImages, disabledImages: disabledImages)
            
            view.setLabelColorWhen(normal: .black, selected: FFA409, disabled: .gray)
//            view.setLabelColorWhen(normalRGB: "000000", selectedRGB: "FFA409", disabledRGB: "FFA409")
            
            view.setLabelFontWhen(normal: .systemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 12), disabled: .systemFont(ofSize: 12))
            //            view.setLabel(font: .systemFont(ofSize: 12))
            
            view.backgroundBlurEnabled = true
            //            view.bottomLine.backgroundColor = UIColor.black
            view.bottomLine.isHidden = false
            // Add custom blurEffectView
            let backgroundView = UIView()
            backgroundView.backgroundColor = .black
            view.blurEffectView = backgroundView
            view.blurEffectViewAlpha = 0.7
            
            // Open and Hide Menu
//            view.alwaysSelected(at: 0)
            //            view.disabledMenuAt(index: 2)
            //view.showAndHideMenuAt(index: 3)
            
            view.setBackgroundColor(color: UIColor.white)

            self.view.addSubview(view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Convert String-type hex color codes into UIColor.
    private func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /// Mask images with UIColor.
    private func imageMaskingwithColor(_ color: UIColor, image: UIImage?) -> UIImage?{
        
        if let image = image {
            
            UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
            let context = UIGraphicsGetCurrentContext()!
            
            color.setFill()
            
            context.translateBy(x: 0, y: image.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            
            let rect = CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height)
            context.draw(image.cgImage!, in: rect)
            
            context.setBlendMode(CGBlendMode.sourceIn)
            context.addRect(rect)
            context.drawPath(using: CGPathDrawingMode.fill)
            
            let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return coloredImage
            
        } else {
            return nil
        }
    }
}

