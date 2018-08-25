import UIKit
import FirebaseAuth
class UserInformationViewController: UIViewController {

    @IBOutlet var userIDLabel: UserinformationLabelStyle!
    @IBOutlet var emailAddressLabel: UserinformationLabelStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Auth.auth().currentUser?.email ?? "Error!")
        emailAddressLabel.text = Auth.auth().currentUser?.email
        userIDLabel.text = Auth.auth().currentUser?.uid 
        // Do any additional setup after loading the view.
    }
    

}
