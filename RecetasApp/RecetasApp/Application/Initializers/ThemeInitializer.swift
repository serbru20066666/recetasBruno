import UIKit

class ThemeInitializer: Initializable {

    func performInitialization() {
        UINavigationBar.appearance(whenContainedInInstancesOf: [RecetasNavigationController.self]).tintColor = .black
        UINavigationBar.appearance(whenContainedInInstancesOf: [RecetasNavigationController.self]).barTintColor = .white
        UINavigationBar.appearance(whenContainedInInstancesOf: [RecetasNavigationController.self]).titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
    }

}
