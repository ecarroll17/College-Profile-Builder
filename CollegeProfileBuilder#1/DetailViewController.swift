import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var city : City!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cityTextField.text = city.name
        stateTextField.text = city.state
        populationTextField.text = String(city.population)
        imageView.image = city.image
    }
    
    @IBAction func onTappedSaveButton(sender: UIButton)
    {
        city.name = cityTextField.text!
        city.state = stateTextField.text!
        city.population = Int(populationTextField.text!)!
    }

}
