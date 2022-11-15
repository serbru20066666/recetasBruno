//
//  RecetasService.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import UIKit
import Alamofire

typealias RecetasListCompletionBlock = (Recetas?) -> (Void)

class RecetasService: NSObject {
    
    @discardableResult
    func getRecetas(_ completion: @escaping RecetasListCompletionBlock) -> DataRequest {
        return Alamofire.request(
            Constants.API.URLBase.appendingPathComponent("/recetas"),
            method: .get
        ).responseData { jsonData in
            if let dataJson = jsonData.data {
                let FoodsList = try? JSONDecoder().decode(Recetas.self, from: dataJson)
                completion(FoodsList)
            } else {
                completion(nil)
            }
            
        }
        
    }

}

