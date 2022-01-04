//
//  TodoInteractor.swift
//  VIPER
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import Foundation

import Alamofire

class TodoInteractor: TodoPresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: TodoInteractorToPresenterProtocol?
    var todos: [Todo]?
    
    // MARK: - Methods
    func fetchTodos() {
       
        NetworkClient.performRequest(object: [Todo].self, router: APIRouter.getTodos) { response in
            
            self.todos = response
            print("todos fetched")
            self.presenter?.todosFetched()
            
        } failure: { error in
            print("todos fetchedFailed")
            self.presenter?.todosFetchedFailed()

        }

        
    }
}
