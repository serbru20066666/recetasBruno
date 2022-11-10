import UIKit

protocol ViewInterface: class {
    func showProgressHUD()
    func hideProgressHUD()
}

extension ViewInterface {
    
    func showProgressHUD() {
        ProgressHUD.showProgress(0.42)
    }
    
    func hideProgressHUD() {
        ProgressHUD.dismiss()
    }
}
