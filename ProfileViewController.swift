
import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    var pick = UIImagePickerController()
    
    let activityMonitor = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var userID: UILabel!
    
    
    @IBOutlet var usrNameLB: UILabel!
    @IBOutlet var addUsernamebuttonOutlet: UIButton!
    let username = Auth.auth().currentUser?.displayName
    var emailString: String = ""
    var userIDLabel: String = ""
    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.tintColor = UIColor.black
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.clipsToBounds = true
        view.addSubview(activityMonitor)
        
        emailString = (Auth.auth().currentUser?.email)!
        userIDLabel = (Auth.auth().currentUser?.uid)!
        emailLabel.text = emailString
        userID.text = userIDLabel
        
        if(username != nil) {
            addUsernamebuttonOutlet.alpha = 0.0
            usrNameLB.text = username
            usrNameLB.alpha = 1.0
        }
        print(username ?? " ")
        // Do any additional setup after loading the view.
    }
    @IBOutlet var profileImg: UIImageView!
    
    @IBAction func addPhotoButton(_ sender: Any) {
//        activityMonitor.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityMonitor.center = self.view.center
        activityMonitor.startAnimating()
        pick.delegate = self
        pick.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(pick, animated: true)
    }
    @IBAction func addUsernameButton(_ sender: Any) {
        
      let changeNameAlert = UIAlertController(title: "Change Name", message: "Type new username bellow", preferredStyle: UIAlertControllerStyle.alert)
        changeNameAlert.addTextField { (txt) in
            txt.placeholder = "Enter here new username"
        }
        changeNameAlert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: { action in
            if let name = changeNameAlert.textFields?.first?.text {
                print(name)
                self.changeRequest?.displayName = name
                self.changeRequest?.commitChanges(completion: { (Error) in
                    if(Error == nil) {
                        print(Auth.auth().currentUser?.displayName ?? "error")
                    }
                })
            }
        }))
        changeNameAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (alert) in
            //....do that here
            print("Cancel")
        }))
        
        present(changeNameAlert, animated: true)
    
    }
    
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        profileImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
        activityMonitor.stopAnimating()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        activityMonitor.stopAnimating()
    }
}
