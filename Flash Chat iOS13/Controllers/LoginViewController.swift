import UIKit
import Firebase


class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          if error != nil {
              print(error!.localizedDescription)
            let alertVC = UIAlertController(title: "Can't login", message: error!.localizedDescription, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alertVC, animated: true)
          } else {
              self?.performSegue(withIdentifier: "LoginToChat", sender: sender)
          }
          
        }
       
    }
    
}
