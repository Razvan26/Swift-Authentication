import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    
    @IBOutlet var emailField: TextFieldStyle!
    
    @IBOutlet var passwordField: TextFieldStyle!
    
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: Any) {
        email = emailField.text!
        password = passwordField.text!
        Auth.auth().signIn(withEmail: email, password: password) { (usr, err) in
            if(usr != nil && err == nil) {
                print(Auth.auth().currentUser?.email ?? "Unknow")
                let cc = self.storyboard?.instantiateViewController(withIdentifier: "usrInfo") 
                self.present(cc!, animated: true )
            }
            else {
                print(err?.localizedDescription ?? "....")
            }
        }
    }
    
}
