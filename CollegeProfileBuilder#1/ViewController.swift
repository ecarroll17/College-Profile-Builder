import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
   

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        editButton.tag = 0
        
        colleges.append(College(name: "University of Illinois", state: "Illinois", numberOfStudents: 27000, image: UIImage(named: "illinois")!))
        colleges.append(College(name: "McKendree University", state: "Illinois", numberOfStudents: 6495, image: UIImage(named: "mckendree")!))
        colleges.append(College(name: "Penn State", state: "Philadelphia", numberOfStudents: 5205, image: UIImage(named: "pennState")!))
        colleges.append(College(name: "Miami University", state: "Florida", numberOfStudents: 4650, image: UIImage(named: "miami")!))
        colleges.append(College(name: "Milwaukee", state: "Wisconsin", numberOfStudents: 5164, image: UIImage(named: "milwaukee")!))
    }
   
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].state
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
       
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"}
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add State Here"}
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
       
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (ACTION) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            let stateTextField = alert.textFields![1] as UITextField
            self.colleges.append(College(name: collegeTextField.text!, state: stateTextField.text!))
            self.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let city = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(city, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem)
    {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }

}

