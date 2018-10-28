//
//  Network.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import Himotoki

public enum AlamofireRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    case loadPhoto
    case loadDessert(city_id: String)

}
protocol Networking {
    func image(url: String) -> Observable<UIImage>
}
final class Network: Networking{
     private let queue = DispatchQueue(label: "DessertProject.Network.Queue")
    func image(url: String) -> Observable<UIImage> {
        return Observable.create { observer in
            let request = Alamofire.request(url, method: .get)
                .validate()
                .response(queue: self.queue, responseSerializer: Alamofire.DataRequest.dataResponseSerializer()) { response in
                    switch response.result {
                    case .success(let data):
                        guard let image = UIImage(data: data) else {
                            observer.onError(NetworkError.IncorrectDataReturned)
                            return
                        }
                        observer.onNext(image)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
