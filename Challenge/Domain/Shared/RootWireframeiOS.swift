import UIKit
import Foundation

class RootWireframeiOS: RootWireframe {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func presentMainView() {
        let charactersNavController = UINavigationController()
        let charactersViewController = CharactersWireframeiOS.createScenne(navigationController: charactersNavController)
        charactersNavController.viewControllers = [charactersViewController]
        window.rootViewController = charactersNavController
    }
}
