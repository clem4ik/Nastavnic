import Foundation

protocol AplicationControllerProtocol: AnyObject{
    func setArr(arr: [AplicationSection])
}
protocol AplicationPresenterProtocol{
    init(view: AplicationControllerProtocol, mockData: [AplicationSection]?, router: RouterProtocol, network: NetworkLayerProtocol, arr: [AplicationSection])
    var mockArray: [AplicationSection] {get set}
    var allCources: [AplicationSection]! {get set}
    func tapOnButton()
    func setCourcesArr()
}
class AplicationPresenter: AplicationPresenterProtocol{
    
    var mockArray: [AplicationSection]
    var view: AplicationControllerProtocol
    var allCources: [AplicationSection]!
    var router: RouterProtocol
    var network: NetworkLayerProtocol
    
    required init(view: AplicationControllerProtocol, mockData: [AplicationSection]?, router: RouterProtocol, network: NetworkLayerProtocol, arr: [AplicationSection]) {
        self.view = view
        self.mockArray = mockData ?? []
        self .router = router
        self.network = network
        self.allCources = arr
    
        setCourcesArr()
        addMockArr()
    }
    
    func addMockArr(){
        //mockArray = MockAplication().createPageDatas()
    }
    
    func tapOnButton() {
        router.createMenueController()
    }
    func setCourcesArr() {
        view.setArr(arr: allCources)
    }
    
}
