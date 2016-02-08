import UIKit
import SafariServices
class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : College!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        collegeTextField.text = college.name
        stateTextField.text = college.state
        numberOfStudentsTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        var students = String(numberOfStudentsTextField)
        websiteTextField.text = college.url
        
    }
    
    @IBAction func onTappedSaveButton(sender: UIButton)
    {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
        college.url = websiteTextField.text!
        college.image = imageView.image
    }
    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        var nameOfWebsite = "\(college.url)"
        var startOfUrl = "http://www."
        var endOfUrl = ".edu"
        var websiteURL = "\(startOfUrl)\(nameOfWebsite)\(endOfUrl)"
        let myURL = NSURL(string: "\(websiteURL)")
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func cameraButtonTapped(sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        else
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func photoButtonTapped(sender: UIButton)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }

}
