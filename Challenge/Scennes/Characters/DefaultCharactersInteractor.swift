import Foundation

class DefaultCharactersInteractor: CharactersInteractor {
    
    private var characters:[Character] = []
    
    func getCharacters(completion: @escaping (Result<[CharacterCellViewModel]>) -> Void) {
        ComicAPIClient().send(GetCharacters()) { (result) in
            switch result {
            case .success(let value):
                self.characters = value.results ??? []
                completion(.success(self.createViewModel(characters: self.characters)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getCharacter(index: Int) -> Character {
        return characters[index]
    }

    func createViewModel(characters:[Character]?) -> [CharacterCellViewModel] {
        guard let characters = characters else {
            return []
        }
        return characters.map({
            return CharacterCellViewModel(name: $0.name ??? "",
                                          aliases: $0.aliases ??? "",
                                          imageURL: $0.image?.thumb_url)
        })
    }
}
