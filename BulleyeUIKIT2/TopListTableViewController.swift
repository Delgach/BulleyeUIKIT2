import UIKit

class TopListTableViewController: UITableViewController, EditScoresTableViewControllerDelegate {
    var topList = [TopItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topList = PersistencyHelper.load()
    }
   
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topItem", for: indexPath)
        let name = cell.viewWithTag(1000) as! UILabel
        let score = cell.viewWithTag(2000) as! UILabel
        
        name.text = topList[indexPath.row].name
        score.text = "\(topList[indexPath.row].score)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topList.count
    }
    
    // MARK:- Edit Scores Table View Delegate
    func editScoresTableViewControllerDidCancel(_ controller: EditScoresTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func editScoresTableViewController(_ controller: EditScoresTableViewController, didFinishEditing item: TopItem) {
        if let index = topList.firstIndex(where: { $0.id == item.id }) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        PersistencyHelper.save(list: topList)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditScoresTableViewController
        
        controller.delegate = self
       
        if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            controller.topItem = topList[indexPath.row]
        }
    }
    
    @IBAction func handleClickReset() {
        topList = []
        tableView.reloadData()
    }
}
