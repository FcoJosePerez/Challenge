import UIKit

class DefaultCharacterDetailPresenter: CharacterDetailPresenter {
    private weak var view: CharacterDetailView?
    private let wireframe: CharacterDetailWireframe
    private let interactor: CharacterDetailInteractor
    
    init(view: CharacterDetailView, wireframe: CharacterDetailWireframe, interactor: CharacterDetailInteractor) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.setupView(viewModel: interactor.getCharacter())
    }
}
