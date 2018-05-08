import Foundation

class DefaultCharacterDetailInteractor: CharacterDetailInteractor {
    
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func getCharacter() -> CharacterDetailViewModel {
        let description = character.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ??? ""
       return  CharacterDetailViewModel(name: character.name ??? "",
                                 birth: character.birth,
                                 realName: character.real_name ??? "",
                                 description: description,
                                 imageURL: character.image?.super_url)
    }

}
