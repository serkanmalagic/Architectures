//
//  TodoProtocols.swift
//  VIPER
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import Foundation

import UIKit

protocol TodoPresenterToViewProtocol: class {
    func showTodos()
    func showError()
}

protocol TodoInteractorToPresenterProtocol: class {
    func todosFetched()
    func todosFetchedFailed()
}

protocol TodoPresentorToInteractorProtocol: class {
    var presenter: TodoInteractorToPresenterProtocol? { get set }
    var todos: [Todo]? { get }
    
    func fetchTodos()
}

protocol TodoToPresenterProtocol: class {
    var view: TodoPresenterToViewProtocol? { get set }
    var interactor: TodoPresentorToInteractorProtocol? { get set }
    var router: TodoPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getTodosCount() -> Int?
    func getTodos() -> [Todo]?
}

protocol TodoPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
