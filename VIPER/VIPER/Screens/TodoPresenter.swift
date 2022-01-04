//
//  TodoPresenter.swift
//  VIPER
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import Foundation


class TodoPresenter: TodoToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: TodoPresenterToViewProtocol?
    var interactor: TodoPresentorToInteractorProtocol?
    var router: TodoPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        print("updateView")
        interactor?.fetchTodos()
    }
    
    func getTodosCount() -> Int? {
        print("getTodosCount")
        return interactor?.todos?.count
    }
    
    func getTodos() -> [Todo]? {
        print("getTodos")
        let a = interactor?.todos
        return interactor?.todos
    }
}

// MARK: - LiveNewsListInteractorToPresenterProtocol
extension TodoPresenter: TodoInteractorToPresenterProtocol {
    
    func todosFetched() {
        print("showTodos")
        view?.showTodos()
    }
    
    func todosFetchedFailed() {
        print("todosFetchedFailed")
        view?.showError()
    }
}
