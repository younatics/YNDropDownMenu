//
//  YNDropDownButton.swift
//  Pods
//
//  Created by YiSeungyoun on 2017. 2. 19..
//
//

class YNDropDownButton: UIButton {
    open var buttonLabel: UILabel?
    open var buttonImage: [UIImage]?
    
    open var labelFontColors: [UIColor] = [.black, .yellow, .gray]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Will be supported soon sorry")
    }
    
    func highlighted() {
        
    }
    
    fileprivate func makeConstraints() {
        buttonLabel = UILabel()
        
        // 버튼들 모두 서브클래스 해서 하이라이팅 될 부분들 한꺼번에 변경 할 수 있게 세팅.
        // 기존 코드에서 분리해서 버튼들은 잘라내서 작업, 나중에 수월하게 찾을 수 있을듯?
        // Menu 에서 백그라운드 색 주게끔 변경 하자.
    }
    
    
}
