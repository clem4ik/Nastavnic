import Foundation

protocol CourcesControllerProtocol: AnyObject{
    
}
protocol CourcesPressenterProtocol{
    init(view: CourcesControllerProtocol, model: MockCourcesProtocol, router: RouterProtocol)
    var allSection: [CourcesSection]! {get set}
    func tapOnMenue()

}
class CourcesPressenter: CourcesPressenterProtocol{
    
    var mockSection: MockCourcesProtocol!
    weak var view: CourcesControllerProtocol!
    var router: RouterProtocol!
    var allSection: [CourcesSection]!
    
    required init(view: CourcesControllerProtocol, model: MockCourcesProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.mockSection = model
        setAllSection()
    }
    
    func setAllSection(){
        allSection = mockSection.addCourcesSections()
    }
    func tapOnMenue() {
        router.popToRoot()
    }
}
