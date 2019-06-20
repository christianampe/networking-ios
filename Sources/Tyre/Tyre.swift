//
//  Created by Christian Ampe on 5/28/19.
//

import Foundation

public protocol TyreProtocol {
    
    /// The core method wrapping a `URLSession` `dataTask`.
    /// - Parameter task: A request object containing all information necessary for making the network request.
    /// - Parameter completion: A  generic result containing either an error or successful response.
    @discardableResult func task(_ request: URLRequest, completion: @escaping (Result<TyreResponse, TyreError>) -> Void) -> URLSessionDataTask
}

public class Tyre : TyreProtocol {
    
    /// A network  session used to make all network requests.
    private let session = URLSession(configuration: .default)
}

public extension Tyre {
    @discardableResult
    func task(_ request: URLRequest,
                     completion: @escaping (Result<TyreResponse, TyreError>) -> Void) -> URLSessionDataTask {
        
        // make network request utilizing Apple's API
        let task = session.dataTask(with: request) { data, response, error in
            
            // ensure the response exists and is an HTTPURLResponse
            guard let response = response as? HTTPURLResponse else {
                
                // server did not responsd to request
                completion(.failure(.unresponsive))
                
                return
            }
            
            // if there is an error this means the request failed
            if let error = error {
                
                // something went wrong and no data will be returned
                completion(.failure(.underlying(error)))
                
            } else if let data = data {
                
                // if there is data map it into a TyreResponse
                completion(.success(TyreResponse(data: data,
                                                 request: request,
                                                 response: response)))
            }
        }
        
        // resume execution
        task.resume()
        
        return task
    }
}
