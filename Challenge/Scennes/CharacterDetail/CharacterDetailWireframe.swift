import Foundation
import UIKit

protocol CharacterDetailWireframe {
    
}

class CharacterDetailWireframeiOS : CharacterDetailWireframe {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createScenne(character:Character, navigationController: UINavigationController?) -> CharacterDetailViewController {
        let vc  = CharacterDetailViewController.initFromStoryboard()
        let wireFrame = CharacterDetailWireframeiOS(navigationController: navigationController)
        vc.presenter = DefaultCharacterDetailPresenter(view: vc,
                                                       wireframe: wireFrame,
                                                       interactor: DefaultCharacterDetailInteractor(character: character))
        return vc
    }
    
}
