import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        stateTextField.text = college.state
        numberOfStudentsTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        var students = String(numberOfStudentsTextField)
    }
    
    @IBAction func onTappedSaveButton(sender: UIButton)
    {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
    }
}
