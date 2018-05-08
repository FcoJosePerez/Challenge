protocol APIClient {
    func send<T: APIRequest>(_ request: T,completion: @escaping (Result<T.response>) -> Void)
}


