import Foundation
import UIKit

protocol CharactersWireframe {
    func goToDetail(character:Character)
}

class CharactersWireframeiOS: CharactersWireframe {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createScenne(navigationController: UINavigationController) -> CharactersViewController {
        let vc  = CharactersViewController.initFromStoryboard()
        let wireFrame = CharactersWireframeiOS(navigationController: navigationController)
        vc.presenter = DefaultCharactersPresenter(view: vc,
                                                  wireframe: wireFrame,
                                                  interactor: DefaultCharactersInteractor())
        return vc
    }
    
    func goToDetail(character: Character) {
        let characterDetailViewContrntrol = CharacterDetailWireframeiOS.createScenne(character: character, navigationController: navigationController)
        navigationController?.pushViewController(characterDetailViewContrntrol, animated: true)
    }
    
}

