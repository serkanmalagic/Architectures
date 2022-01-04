//
//  TodoRouter.swift
//  VIPER
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import Foundation
import UIKit

class TodoRouter: TodoPresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = TodoViewController()
        let presenter: TodoToPresenterProtocol & TodoInteractorToPresenterProtocol = TodoPresenter()
        let interactor: TodoPresentorToInteractorProtocol = TodoInteractor()
        let router: TodoPresenterToRouterProtocol = TodoRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
