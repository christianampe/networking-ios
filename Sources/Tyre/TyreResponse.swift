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

public struct TyreResponse: TyreResponseProtocol {
    public let data: Data
    public let request: URLRequest
    public let response: HTTPURLResponse
    
    /// Explicit initializer.
    ///
    /// - Parameter data: The data returned from the network request.
    /// - Parameter request: The url request sent to server.
    /// - Parameter response: The HTTP url response returned from server.
    public init(data: Data,
                request: URLRequest,
                response: HTTPURLResponse) {
        
        self.data = data
        self.request = request
        self.response = response
    }
}
