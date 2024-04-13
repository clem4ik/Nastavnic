import Foundation
import UIKit

protocol RouterMainProtocol{
    var navigationController: UINavigationController? {get set}
    var assamblyBuilder: AssamblyBuilderProtocol? {get set}
}
protocol RouterProtocol: RouterMainProtocol{
    func initial()
    //func afterRegistrationInitial()
    func popToRoot()
    func popController()
    func createSecond()
    func createThree(id: Int)
    func createFour(id: Int)
    func createSelectCategoryControll(arr: [DecodeCategorys], id: Int)
    func createMainAplicationControll(arr: [AplicationSection])
    func createMenueController()
    func createCompareControll(mail: String)
    func createCourcesControll()
    
}
class Router: RouterProtocol{
    var navigationController: UINavigationController?
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assamblyBuilder = assamblyBuilder
    }
    func initial() {
        if let navigationController = navigationController{
            guard let mainViewController = assamblyBuilder?.createController(router: self) else{return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    func afterRegistrationInitial() {
        if let navigationController = navigationController{
            guard let afterMainController = assamblyBuilder?.createLoadController(router: self) else {return}
            navigationController.viewControllers = [afterMainController]
        }
    }
    func createSecond() {
        if let navigationController = navigationController{
            guard let secondViewController = assamblyBuilder?.createSecondController(router: self) else{return}
            navigationController.pushViewController(secondViewController, animated: true)
                    
        }
    }
    func popToRoot() {
        if let navigationController = navigationController{
            navigationController.popToRootViewController(animated: true)
        }
    }
    func popController() {
        if let navigationController = navigationController{
            navigationController.popViewController(animated: true)
        }
    }
    func createThree(id: Int) {
        if let navigationController = navigationController{
            guard let userInfo = assamblyBuilder?.createUserInfoController(router: self, id: id) else{return}
            navigationController.pushViewController(userInfo, animated: true)
        }
    }
    func createFour(id: Int) {
        if let navigationController = navigationController{
            guard let categoryController = assamblyBuilder?.createCategoryController(router: self, id: id) else{fatalError()}
            navigationController.pushViewController(categoryController, animated: true)
        }
    }
    func createSelectCategoryControll(arr: [DecodeCategorys], id: Int) {
        
        if let navigationController = navigationController{
            guard let aplicationController = assamblyBuilder?.createSelectController(router: self, arr: arr, id: id) else{fatalError()}
            navigationController.pushViewController(aplicationController, animated: true)
        }
    }
    
    func createMainAplicationControll(arr: [AplicationSection]) {
        if let navigationController = navigationController{
            guard let aplicationController = assamblyBuilder?.createMainAplicationController(router: self, arr: arr) else{fatalError()}
            navigationController.pushViewController(aplicationController, animated: true)
        }
    }
    func createMenueController() {
        if let navigationController = navigationController{
            guard let menueController = assamblyBuilder?.createMenueController(router: self) else{fatalError()}
            navigationController.pushViewController(menueController, animated: true)
        }
    }
    func createCompareControll(mail: String) {
        if let navigationController = navigationController{
            guard let compare = assamblyBuilder?.createCompareCodeControll(router: self, mail: mail) else{fatalError()}
            navigationController.pushViewController(compare, animated: true)
        }
    }
    func createCourcesControll() {
        if let navigationController = navigationController{
            guard let cources = assamblyBuilder?.createCourcesControll(router: self)
            else{fatalError()}
            navigationController.pushViewController(cources, animated: true)
        }
    }
}
