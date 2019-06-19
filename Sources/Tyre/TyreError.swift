//
//  Created by Christian Ampe on 5/28/19.
//

import Foundation

enum TyreError: Error {
    
    /// Returned when no response is returned from the server.
    case unresponsive
    
    /// Returned when the data task returns an error.
    case underlying(Error)
}
