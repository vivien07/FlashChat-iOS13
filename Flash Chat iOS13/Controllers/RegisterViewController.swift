import UIKit
import Firebase


class RegisterViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
   
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                //print(error!.localizedDescription)
                let alertVC = UIAlertController(title: "Can't register", message: error!.localizedDescription, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertVC, animated: true)
            } else {
                self.performSegue(withIdentifier: "RegisterToChat", sender: sender)
            }
        }
        
    }
    
}
