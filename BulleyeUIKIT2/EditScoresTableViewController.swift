import UIKit

protocol EditScoresTableViewControllerDelegate: class {
    func editScoresTableViewControllerDidCancel(_ controller: EditScoresTableViewController)
    func editScoresTableViewController(_ controller: EditScoresTableViewController, didFinishEditing item: TopItem)
}


class EditScoresTableViewController: UITableViewController, UITextViewDelegate {
    @IBOutlet weak var textInputField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: EditScoresTableViewControllerDelegate?
    var topItem: TopItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInputField.text = topItem.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        textInputField.becomeFirstResponder()
    }
    
    // MARK:- Actions
    @IBAction func handleClickDone() {
        topItem.name = textInputField.text!
        
        delegate?.editScoresTableViewController(self, didFinishEditing: topItem)
    }
    
    @IBAction func handleClickCancel() {
        delegate?.editScoresTableViewControllerDidCancel(self)
    }
   
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK:- Text View Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
}

