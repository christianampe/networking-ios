//
//  Created by Christian Ampe on 5/28/19.
//

import Foundation

public protocol TyreResponseProtocol {
    
    /// Data returned from an operation.
    var data: Data { get }
    
    /// The request sent.
    var request: URLRequest { get }
    
    /// The response returned from the server.
    var response: HTTPURLResponse { get }
}

public struct TyreResponse : TyreResponseProtocol {
    
    /// Data returned from the network request.
    public let data: Data
    
    /// URL request sent to server.
    public let request: URLRequest
    
    /// HTTP url response returned from server.
    public let response: HTTPURLResponse
    
    /// Explicit initializer.
    ///
    /// - Parameters:
    ///   - data: The data returned from the network request.
    ///   - request: The url request sent to server.
    ///   - response: The HTTP url response returned from server.
    public init(data: Data,
         request: URLRequest,
         response: HTTPURLResponse) {
        
        self.data = data
        self.request = request
        self.response = response
    }
}
