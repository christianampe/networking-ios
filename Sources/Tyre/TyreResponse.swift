//
//  Created by Christian Ampe on 5/28/19.
//

import Foundation

protocol TyreResponseProtocol {
    
    /// Data returned from an operation.
    var data: Data { get }
    
    /// The request sent.
    var request: URLRequest { get }
    
    /// The response returned from the server.
    var response: HTTPURLResponse { get }
}

struct TyreResponse: TyreResponseProtocol {
    
    /// Data returned from the network request.
    let data: Data
    
    /// URL request sent to server.
    let request: URLRequest
    
    /// HTTP url response returned from server.
    let response: HTTPURLResponse
    
    /// Explicit initializer.
    ///
    /// - Parameters:
    ///   - data: The data returned from the network request.
    ///   - request: The url request sent to server.
    ///   - response: The HTTP url response returned from server.
    init(data: Data,
         request: URLRequest,
         response: HTTPURLResponse) {
        
        self.data = data
        self.request = request
        self.response = response
    }
}
