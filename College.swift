import UIKit

class College: NSObject
{
    var name = ""
    var state = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var url = ""
    
    convenience init(name: String, state: String, numberOfStudents: Int, image: UIImage, url: String)
    {
        self.init()
        self.name = name
        self.state = state
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.url = url
    }
    
    convenience init(name: String, state: String, url: String)
    {
        self.init()
        self.name = name
        self.state = state
        self.url = url
    }
    
    convenience init(name: String, state: String)
    {
        self.init()
        self.name = name
        self.state = state
    }
}