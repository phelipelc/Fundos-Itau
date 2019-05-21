//
//  LoginPresenter.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit

class LoginPresenter: ViewToPresenterProtocol, InteractorToPresenterProtocol {
    static var fields = [Fields]()
    func fieldsFetchedSuccess(fieldsModelArray: Array<Fields>) {
        view?.hideLoading()
        view?.addFields(fieldsModelArray)
    }
    
    func noticeFetchFailed() {
        
    }
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func didLoad() {
        view?.showLoading()
        interactor?.fetchFields()
    }
    

}
