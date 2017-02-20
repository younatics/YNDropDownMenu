//
//  YNDropDownButton.swift
//  Pods
//
//  Created by YiSeungyoun on 2017. 2. 19..
//
//

class YNDropDownButton: UIButton {
    fileprivate var centerXwithOffsetConstraint: NSLayoutConstraint!
    fileprivate var centerYConstraint: NSLayoutConstraint!

    open var buttonImageView: UIImageView!
    
    open var buttonLabel: UILabel!
    open var buttonLabelText: String?
    open var buttonImages: YNImages? {
        didSet {
            self.initViewWithImage()
        }
    }
    
    open var labelFontColors: [UIColor] = [.black, .yellow, .gray]

    public init(frame: CGRect, buttonLabelText: String?) {
        super.init(frame: frame)

        self.buttonLabelText = buttonLabelText
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Will be supported soon sorry")
    }
    
    func normal() {
        
    }
    
    func highlighted() {
        
    }
    
    func disabled() {
        
    }
    
    func selected() {
        
    }
    
    fileprivate func initViewWithImage() {
        self.removeConstraints([centerXwithOffsetConstraint, centerYConstraint])
        
        if let _buttonImage = buttonImages?.normal {
            let centerXwithOffsetConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: -((_buttonImage.size.height+4)/2))
            
            let centerYConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
            
            self.addConstraints([centerXwithOffsetConstraint,centerYConstraint])
            
            buttonImageView = UIImageView()
            buttonImageView.image = _buttonImage
            buttonImageView.translatesAutoresizingMaskIntoConstraints = false
            
            let buttonImageViewXContraint = NSLayoutConstraint(item: buttonImageView, attribute: .left, relatedBy: .equal, toItem: buttonLabel, attribute: .right, multiplier: 1.0, constant: 4)
            let buttonImageViewYConstraint = NSLayoutConstraint(item: buttonImageView, attribute: .centerY, relatedBy: .equal, toItem: buttonLabel, attribute: .centerY, multiplier: 1.0, constant: 0)
            
            let buttonImageViewHeight = NSLayoutConstraint(item: buttonImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _buttonImage.size.height)
            let buttonImageViewWidth = NSLayoutConstraint(item: buttonImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: _buttonImage.size.width)
            
            self.addSubview(buttonImageView)
            
            self.addConstraints([buttonImageViewXContraint,buttonImageViewYConstraint,buttonImageViewHeight,buttonImageViewWidth])
        }
    }
    
    fileprivate func initView() {
        // 버튼들 모두 서브클래스 해서 하이라이팅 될 부분들 한꺼번에 변경 할 수 있게 세팅.
        // 기존 코드에서 분리해서 버튼들은 잘라내서 작업, 나중에 수월하게 찾을 수 있을듯?
        // Menu 에서 백그라운드 색 주게끔 변경 하자.
        
        self.backgroundColor = UIColor.white
        
        buttonLabel = UILabel()
        buttonLabel.text = self.buttonLabelText
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonLabel)
        
        centerXwithOffsetConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        centerYConstraint = NSLayoutConstraint(item: buttonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        self.addConstraints([centerXwithOffsetConstraint,centerYConstraint])
    }
}
