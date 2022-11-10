import Foundation
import Japx

extension JapxDecoder {
    
    static var kebabCaseDecoder: JapxDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromKebabCase
        return JapxDecoder(jsonDecoder: decoder)
    }
    
}
