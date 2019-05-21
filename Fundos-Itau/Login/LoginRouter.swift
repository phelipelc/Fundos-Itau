//
//  LoginRouter.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit

class LoginRouter: PresenterToRouterProtocol {
    static func createModule(view: LoginViewController) {
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = LoginPresenter()
        let interactor: PresenterToInteractorProtocol = LoginInteractor()
      //  let router:PresenterToRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
//        presenter.router = router
//        presenter.interactor = interactor
//        interactor.presenter = presenter
        
    }
    
   
    

}
