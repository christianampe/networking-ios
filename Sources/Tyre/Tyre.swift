//
//  Created by Christian Ampe on 5/28/19.
//

import Foundation

// MARK: - Interface
private protocol TyreInterface {
    
    /// The associated response returned when performing a successful task.
    associatedtype Response: TyreResponseProtocol
    
    /// The associated error passed back when performing a failed task.
    associatedtype Error: Swift.Error
    
    /// The core method wrapping a `URLSession` `dataTask`.
    ///
    /// - Parameter task: A request object containing all information necessary for making the network request.
    /// - Parameter completion: A  generic result containing either an error or successful response.
    @discardableResult
    func task(_ request: URLRequest,
              completion: @escaping (Result<Response, Error>) -> Void) -> URLSessionDataTask
}

// MARK: - Class Declaration
public class Tyre<Error: Swift.Error> {
    
    /// A network  session used to make all network requests.
    private let session: URLSession
    
    /// The default initializer.
    /// - Parameter session: The `URLSession` used to make network requests.
    public init(_ session: URLSession = .init()) {
        self.session = session
    }
}

// MARK: - TyreInterface Conformation
extension Tyre: TyreInterface {
    
    /// The core method wrapping a `URLSession` `dataTask`.
    ///
    /// - Parameter task: A request object containing all information necessary for making the network request.
    /// - Parameter completion: A  generic result containing either an error or successful response.
    @discardableResult
    public func task(_ request: URLRequest,
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
