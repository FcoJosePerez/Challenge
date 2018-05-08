import Foundation

/// Implementation of a generic-based Marvel API client
public class ComicAPIClient {
    private let baseEndpoint = "https://comicvine.gamespot.com/api/"
    private let session = URLSession(configuration: .default)
    private let publicKey = "4d89fcedbb22a1fe5c66093e68a775df640d3a81"
//    public init(publicKey: String) {
//        self.publicKey = publicKey
//    }
    
    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.response>>) {
        let endpoint = self.endpoint(for: request)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                do {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    let comicResponse = try JSONDecoder().decode(DataContainer<T.response>.self, from: data)
                    ui{
                        if let _ = comicResponse.results {
                            completion(.success(comicResponse))
                        } else {
                            completion(.failure(ComicError.decoding))
                        }
                    }
                } catch {
                    ui{
                        completion(.failure(error))
                        
                    }
                }
            } else if let error = error {
                ui{
                    completion(.failure(error))
                    
                }
            }
        }
        task.resume()
    }
    
    /// Encodes a URL based on the given request
    /// Everything needed for a public request to Marvel servers is encoded directly in this URL
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        // Construct the final URL with all the previous data
        return URL(string: "\(baseEndpoint)\(request.resourceName)?api_key=\(publicKey)&format=JSON")!
    }
}
