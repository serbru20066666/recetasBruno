import UIKit
import Alamofire
import AlamofireNetworkActivityIndicator

class AlamofireInitializer: Initializable {

    func performInitialization() {
        let networkActivityManager = NetworkActivityIndicatorManager.shared
        networkActivityManager.isEnabled = true
        networkActivityManager.startDelay = 0
    }

}
