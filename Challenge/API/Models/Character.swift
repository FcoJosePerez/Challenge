import Foundation

public struct Character: Decodable {
    public let name: String?
    public let real_name: String?
    public let image: Image?
    public let aliases: String?
    public let description: String?
    public let birth: String?
}
