
import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet var emailAddress: TextFieldStyle!
    
    @IBOutlet var password: TextFieldStyle!
    
    var emailTextField: String = ""
    var passworldFromTextField: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(_ sender: Any) {
       emailTextField = emailAddress.text!
        passworldFromTextField = password.text!
        print(emailTextField)
        print(passworldFromTextField)
        Auth.auth().createUser(withEmail: emailTextField, password: passworldFromTextField) { (auth, err) in
            
            if err == nil && auth != nil {
                print("User has been created with success!")
          
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "usrInfo") //next view
                self.present(vc!, animated: true)
                
            }
            else {
                print(err.debugDescription)
            }
            
        }
        
    }
    
}

