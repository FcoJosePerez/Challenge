import UIKit

class DefaultCharactersPresenter: CharactersPresenter {

    private weak var view: CharactersView?
    private let wireframe: CharactersWireframe
    private let interactor: CharactersInteractor
    
    init(view: CharactersView, wireframe: CharactersWireframe, interactor: CharactersInteractor) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        loadCharacters()
    }
    
    func reload() {
        loadCharacters()
    }
    
   private func loadCharacters() {
        view?.showLoadingView()
        interactor.getCharacters { (result) in
            self.view?.hideLoadingView()
            switch result {
            case .success(let value):
                self.view?.setupView(viewModel: CharactersViewModel(items: value))
            case .failure(let error):
                self.view?.showError(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func goToDetail(index: Int) {
       wireframe.goToDetail(character: interactor.getCharacter(index: index))
    }
    
}
