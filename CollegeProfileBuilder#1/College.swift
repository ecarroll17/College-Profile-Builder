import UIKit

class College: NSObject

{
    var name = ""
    var state = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    
    convenience init(name: String, state: String, numberOfStudents: Int, image: UIImage)
    {
        self.init()
        self.name = name
        self.state = state
        self.numberOfStudents = numberOfStudents
        self.image = image
    }
   
    convenience init(name: String)
    {
        self.init()
        self.name = name
    }
}

