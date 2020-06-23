import UIKit

enum ResponseCode: Int {
    case OK = 200
    case BadRequest = 400
    case Forbidden = 403
    case NotFound = 404
    case InternalServerError = 500
    case BadGateway = 502
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // 1
        //let urlString = "http://date.jsontest.com"
        let urlString = "http://httpstat.us/403"
        self.testWebService(urlString: urlString)
        
}

func testWebService(urlString: String) {
    
    guard let url = URL(string: urlString) else { return }
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    let task = session.dataTask(with: url) { data, response, error in
        
        if error != nil {
            print(error!.localizedDescription)
        } else {
            
            if let data = data, let response = response as? HTTPURLResponse {
                print("Response \(response.statusCode)")
                
                if self.isResponseOK(nResponseCode: response.statusCode) {
                    print("OK")
                }else {
                    print("Error: \(self.getErrorCode(ResponseCode(rawValue: response.statusCode)!))")
                    
                }
            }
        }
    }
    task.resume()
    
    }
    
    
    func isResponseOK (nResponseCode : Int) -> Bool {
        
        if nResponseCode == ResponseCode.OK.rawValue {
            return true
        }
        
        return false
    }
    
    func getErrorCode(_ enumCode : ResponseCode) -> String {
                
        var strError = ""
        switch enumCode {
        case .BadRequest:
            strError = "BadRequest"
            
        case .Forbidden:
            strError = "Forbidden"
            
        case .NotFound:
            strError = "NotFound"
            
        case .InternalServerError:
            strError = "InternalServerError"
            
        case .BadGateway:
            strError = "BadGateway"
            
        default:
            strError = ""
        }
        
        return strError
    }
    
    func getErrorCode1(_ nEnum : Int) -> String {
         
        guard let enumCode = ResponseCode(rawValue: nEnum) else { return "" }
         
         var strError = ""
         switch enumCode {
         case .BadRequest:
             strError = "BadRequest"
             
         case .Forbidden:
             strError = "Forbidden"
             
         case .NotFound:
             strError = "NotFound"
             
         case .InternalServerError:
             strError = "InternalServerError"
             
         case .BadGateway:
             strError = "BadGateway"
             
         default:
             strError = ""
         }
         
         return strError
     }
    
    
    func isValidPassword(_ text: String, _ repeatedText: String) -> Bool {
        let meetsMinimumLength = text.count >= 8
        let passwordsMatch = repeatedText == text
        return meetsMinimumLength && passwordsMatch
    }
    
}
