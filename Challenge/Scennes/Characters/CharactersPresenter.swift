import UIKit

protocol CharactersPresenter: Presenter {
    func goToDetail(index: Int)
    func reload()
}
