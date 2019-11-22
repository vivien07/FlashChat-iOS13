import UIKit
import Firebase


class ChatViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "test@user.com", text: "Hello!"),
        Message(sender: "a@b.fr", text:"Hi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "⚡️FlashChat"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    
    @objc func logout() {
        
        print("logout tapped")
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)//Pops all the view controllers on the stack except the root view controller and updates the display
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
        
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    

}



extension ChatViewController: UITableViewDataSource {
    
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.sender
        cell.detailTextLabel?.text = message.text
        return cell
       
    }
    

    
}



extension ChatViewController: UITableViewDelegate {
    
    
    
}


