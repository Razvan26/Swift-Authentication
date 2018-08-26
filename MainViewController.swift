import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "log") as! LoginViewController
        present(vc, animated: true)
    }
    
    @IBAction func RegisterBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "reg") as! RegisterViewController
        present(vc, animated: true)
    }
    
}
