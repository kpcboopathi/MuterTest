import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
//        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    
    func isValidPassword(_ text: String) -> Bool {
        
        // "One upper case letter"
        let meetsOneUpperCase = text.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
         
        // One number
        let meetsOneNumber = text.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
        
        // Minimum Length
        let meetsMinimumLength = text.count >= 8
        
        // Maximum Length
        let meetsMaximumLength = text.count <= 12
        
        return meetsMinimumLength && meetsMaximumLength && meetsOneUpperCase && meetsOneNumber
    }
    
    func isValidConfirmPassword(_ text: String, _ repeatedText: String) -> Bool {
        
        let passwordsMatch = repeatedText == text
        return passwordsMatch
    }
    
}
