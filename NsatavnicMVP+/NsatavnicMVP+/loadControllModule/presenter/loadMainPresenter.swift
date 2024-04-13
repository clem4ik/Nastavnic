import Foundation

protocol LoadControllerProtocol: AnyObject{
}
protocol LoadPresenterProtocol{
    init(view: LoadControllerProtocol, network: NetworkLayerProtocol, router: RouterProtocol)
    var aplicationArr: [AplicationSection]! {get set}
    
}
class LoadPresenter: LoadPresenterProtocol{
    
    weak var view: LoadControllerProtocol!
    var router: RouterProtocol!
    var network: NetworkLayerProtocol!
    var aplicationArr: [AplicationSection]!
    
    var courcesSection: AplicationSection!
    var storysSection: AplicationSection!
    
    required init(view: LoadControllerProtocol, network: NetworkLayerProtocol, router: RouterProtocol) {
        self.view = view
        self.network = network
        self.router = router
        
        getStorys()
        getStorys()
    }
    
    func getStorys(){
        network.addSyorys(id: "5") { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result{
                case .success(let allStorys):
                    self.storysSection = .storys(allStorys)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getCources(){
        network.addAllCources { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(let allCources):
                    self.courcesSection = .firstSection(allCources)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func setSectionsArr(){
        aplicationArr = [storysSection, courcesSection]
    }
    
}
