import Foundation

protocol CharactersInteractor: Interactor {
    func getCharacters( completion: @escaping ResultCallback<[CharacterCellViewModel]>)
    func getCharacter(index:Int) -> Character
}
