class UserInformationLabelStyle: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        labelStyles()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        labelStyles()
    }
    
    func labelStyles() {
        self.textColor = UIColor.white
    
    }
}
