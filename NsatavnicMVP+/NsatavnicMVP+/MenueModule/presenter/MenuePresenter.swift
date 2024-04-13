import Foundation

protocol MenueControllerProtocol: AnyObject{
    
}
protocol MenuePresenterProtocol{
    init(view: MenueControllerProtocol, datasArr: MockMenueProtocol, router: RouterProtocol)
    var mockData: MockMenueProtocol {get set}
    func tapOnButton()
    func tapOnCourcesButton()
}
class MenuePresenter: MenuePresenterProtocol{
    
    var mockData: MockMenueProtocol
    weak var view: MenueControllerProtocol!
    var router: RouterProtocol
    
    required init(view: MenueControllerProtocol, datasArr: MockMenueProtocol, router: RouterProtocol) {
        self.view = view
        self.mockData = datasArr
        self.router = router
    }
    func tapOnButton() {
        router.popController()
    }
    func tapOnCourcesButton() {
        router.createCourcesControll()
    }
}
