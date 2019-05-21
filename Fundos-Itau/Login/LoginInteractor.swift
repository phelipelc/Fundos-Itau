//
//  LoginInteractor.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class LoginInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchFields() {
        Alamofire.request(Constants.CELLS).response { (response) in
            guard let data = response.data else { return }
            do {
                
                let cells = try JSONDecoder().decode(Cells.self, from: data)
                //completion(tweetRequest)
                self.presenter?.fieldsFetchedSuccess(fieldsModelArray: cells.fields!)
            } catch let error {
                print(error)
                //completion(nil)
            }

        }
    }
    
    

}
