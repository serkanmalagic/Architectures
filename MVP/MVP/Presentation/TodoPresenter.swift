//
//  TodoPresenter.swift
//  MVP
//
//  Created by Serkan Mehmet Malagiç on 3.01.2022.
//

import Foundation
import UIKit

protocol TodoPresenterView: AnyObject {
    func callTodos(model : [Todo]? )
}

class TodoPresenter {
    
    weak var view: TodoPresenterView?
    var todos = [Todo]()
    
    // Pass something that conforms to PresenterView
    init(with view: TodoPresenterView) {
        
        self.view = view
        
    }
        
    func callTodos(vc : UIViewController) {
        
        todos.removeAll()
        
        NetworkClient.performRequest(vc : vc, object: [Todo].self, router: APIRouter.getTodos) { response in
            
            self.view?.callTodos(model : response)
            
        } failure: { error in
        
            let alert = UIAlertController(title: error.localizedDescription, message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
            
        }

    }
    
}
