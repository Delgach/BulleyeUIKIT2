import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func naviateToMainViewController() {
        dismiss(animated: true, completion: nil)
    }
}

