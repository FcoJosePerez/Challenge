import Foundation

/// All successful responses return this, and contains all
/// the metainformation about the returned chunk.
public struct DataContainer<Results: Decodable>: Decodable {
    public let error: String
    public let limit: Int
    public let offset: Int
    public let number_of_page_results: Int
    public let number_of_total_results: Int
    public let status_code: Int
    public let results: Results?
    
    public init(error: String = "",
                limit: Int = 0,
                offset: Int = 0,
                number_of_page_results: Int = 0,
                number_of_total_results: Int = 0,
                status_code: Int = 0,
                results: Results
        ) {
        self.error = error
        self.limit = limit
        self.offset = offset
        self.number_of_page_results = number_of_page_results
        self.number_of_total_results = number_of_total_results
        self.status_code = status_code
        self.results = results
    }
}
