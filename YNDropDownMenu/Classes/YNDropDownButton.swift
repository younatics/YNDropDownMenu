//
//  YNDropDownButton.swift
//  Pods
//
//  Created by YiSeungyoun on 2017. 2. 19..
//
//

class YNDropDownButton: UIButton {
    private var centerXwithOffsetConstraint: NSLayoutConstraint!
    private var centerYConstraint: NSLayoutConstraint!

    open var buttonImageView: UIImageView!
    
    open var buttonLabel: UILabel!
    open var buttonLabelText: String?
    open var buttonImages: YNImages? {
        didSet {
            self.initViewWithImage()
        }
    }
    open var labelFontColors: YNFontColor?

    public init(frame: CGRect, buttonLabelText: String?) {
        super.init(frame: frame)

        self.buttonLabelText = buttonLabelText
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Will be supported soon sorry")
    }
    
    open func normal() {
        if let _buttonImage = buttonImages?.normal {
            self.buttonImageView.image = _buttonImage
        }
        if let _fontColor = labelFontColors?.normal {
            self.buttonLabel.textColor = _fontColor
        }
    }
    
    open func highlighted() {
        if let _buttonImage = buttonImages?.highlighted {
            self.buttonImageView.image = _buttonImage
        }
        if let _fontColor = labelFontColors?.highlighted {
            self.buttonLabel.textColor = _fontColor
        }
    }
    
    open func selected() {
        if let _buttonImage = buttonImages?.selected {
            self.buttonImageView.image = _buttonImage
        }
        if let _fontColor = labelFontColors?.selected {
            self.buttonLabel.textColor = _fontColor
        }
    }
    
    open func disabled() {
        if let _buttonImage = buttonImages?.disabled {
            self.buttonImageView.image = _buttonImage
        }
        if let _fontColor = labelFontColors?.disabled {
            self.buttonLabel.textColor = _fontColor
        }
    }
    

    private func initViewWithImage() {
        self.removeConstraints([centerXwithOffsetConstraint, centerYConstraint])
        
        if let _buttonImage = buttonImages?.normal {
            let centerXwithOffsetConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: -((_buttonImage.size.height+4)/2))
            
            let centerYConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
            
            self.addConstraints([centerXwithOffsetConstraint,centerYConstraint])
            
            self.buttonImageView = UIImageView()
            self.buttonImageView.image = _buttonImage
            self.buttonImageView.translatesAutoresizingMaskIntoConstraints = false
            
            let buttonImageViewXContraint = NSLayoutConstraint(item: buttonImageView, attribute: .left, relatedBy: .equal, toItem: buttonLabel, attribute: .right, multiplier: 1.0, constant: 4)
            let buttonImageViewYConstraint = NSLayoutConstraint(item: buttonImageView, attribute: .centerY, relatedBy: .equal, toItem: buttonLabel, attribute: .centerY, multiplier: 1.0, constant: 0)
            
            let buttonImageViewHeight = NSLayoutConstraint(item: buttonImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _buttonImage.size.height)
            let buttonImageViewWidth = NSLayoutConstraint(item: buttonImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _buttonImage.size.width)
            
            self.addSubview(buttonImageView)
            
            self.addConstraints([buttonImageViewXContraint,buttonImageViewYConstraint,buttonImageViewHeight,buttonImageViewWidth])
        }
    }
    
    private func initView() {
        // 버튼들 모두 서브클래스 해서 하이라이팅 될 부분들 한꺼번에 변경 할 수 있게 세팅.
        // 기존 코드에서 분리해서 버튼들은 잘라내서 작업, 나중에 수월하게 찾을 수 있을듯?
        // Menu 에서 백그라운드 색 주게끔 변경 하자.
        
        self.backgroundColor = UIColor.white
        
        self.buttonLabel = UILabel()
        self.buttonLabel.text = self.buttonLabelText
        self.buttonLabel.font = UIFont.systemFont(ofSize: 12)
        self.buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.buttonLabel)
        
        centerXwithOffsetConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        centerYConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        self.addConstraints([centerXwithOffsetConstraint,centerYConstraint])
    }
}
