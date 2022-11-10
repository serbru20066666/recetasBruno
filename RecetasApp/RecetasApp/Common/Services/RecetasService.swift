//
//  RecetasService.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import UIKit
import Alamofire
import Japx

typealias RecetasListCompletionBlock = (DataResponse<Recetas>) -> (Void)

class RecetasService: NSObject {
    
    @discardableResult
    func getRecetas(_ completion: @escaping RecetasListCompletionBlock) -> DataRequest {
        return Alamofire.request(
            Constants.API.URLBase.appendingPathComponent("/recetas"),
            method: .get
        ).responseCodableJSONAPI(decoder: .init(), completionHandler: completion)
        
    }

}
