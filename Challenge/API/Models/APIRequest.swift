public protocol APIRequest: Encodable {
    var resourceName: String { get }
    associatedtype response: Decodable
}
