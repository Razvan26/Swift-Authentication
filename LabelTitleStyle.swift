import UIKit
@IBDesignable
class LabelStyleTitle: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        labelStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        labelStyle()
    }
    
    func labelStyle()  {
        self.textColor = UIColor.white
        self.textAlignment = .center
    }
    
    
}
