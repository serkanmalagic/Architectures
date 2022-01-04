//
//  NetworkApiClient.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 18.10.2021.
//

import Foundation
import Alamofire
import NVActivityIndicatorView

struct NetworkClient {
    
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())
    
    // object parameter is added here so the T generic param can infer the type
    // All objects must conform to "Decodable" protocol
    static func performRequest<T>(object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable{
       
        AF.request(router)
            .responseJSON { (response) in
                do {
                    let data = try JSONDecoder().decode(T.self, from: response.data!)
                    success(data)
                } catch let error{
                    failure(error)
                }
            }
    }
}
