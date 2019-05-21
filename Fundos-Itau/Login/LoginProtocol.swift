//
//  LoginProtocol.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit

    protocol ViewToPresenterProtocol: class{
        
        var view: PresenterToViewProtocol? {get set}
        var interactor: PresenterToInteractorProtocol? {get set}
        var router: PresenterToRouterProtocol? {get set}
      //  func startFetchingNotice()
        func didLoad()
        //func showMovieController(navigationController:UINavigationController)
        
    }
    
    protocol PresenterToViewProtocol: class{
        //func showNotice(noticeArray:Array<Fields>)
        func addFields(_ fields: [Fields])
        func showError()
        func showLoading()
        func hideLoading()
    }
    
    protocol PresenterToRouterProtocol: class {
        static func createModule(view: LoginViewController)
      //  func pushToMovieScreen(navigationConroller:UINavigationController)
    }
    
    protocol PresenterToInteractorProtocol: class {
        var presenter:InteractorToPresenterProtocol? {get set}
        func fetchFields()
    }
    
    protocol InteractorToPresenterProtocol: class {
        func fieldsFetchedSuccess(fieldsModelArray: Array<Fields>)
        func noticeFetchFailed()
    }


