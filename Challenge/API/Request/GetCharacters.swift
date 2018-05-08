import Foundation

public struct GetCharacters: APIRequest {
    public var resourceName: String {
        return "characters"
    }
    public typealias response = [Character]
}
