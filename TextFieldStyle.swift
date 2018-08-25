import UIKit

class TextFieldStyle: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        TextFieldStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TextFieldStyles()
    }
    
    func TextFieldStyles() {
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font?.withSize(30.00)
        self.alpha = 0.6
        self.backgroundColor = UIColor.black
    }
    
}
