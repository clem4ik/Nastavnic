import Foundation
import RealmSwift

protocol SelectCategoryProtocol: AnyObject{
    func setSelectArr(arr: [DecodeCategorys])
    func setId(id: Int)
}
protocol SelectCategoryPresenterProtocol{
    init(view: SelectCategoryProtocol, selectArr: [DecodeCategorys], mockData: CategoryDatasProtocol, router: RouterProtocol!, id: Int, network: NetworkLayerProtocol)
    
    var id: Int! {get set}
    var registrationStatus: Int! {get set}
    
    func setArr()
    func tapOncontinuButton()
    func tapOnBackButton()
    func setId()
    func addSelectId()->[Int]
    func addPost(userId: Int, categorysId: [Int])
    func setCources()
}
class SelectPresenter: SelectCategoryPresenterProtocol{
    
    var mockData: CategoryDatasProtocol!
    weak var view: SelectCategoryProtocol!
    var arr: [DecodeCategorys]!
    var router: RouterProtocol!
    var id: Int!
    var network: NetworkLayerProtocol!
    var registrationStatus: Int!
    static var items: Results<RealmDataBase>!
    
    var allCources: [AplicationSection]!
    var firstCategorys: AplicationSection!
    var regInfo = RealmDataBase()
    var allStorys: AplicationSection!
    
    static var realm = try! Realm()
    
    required init(view: SelectCategoryProtocol, selectArr: [DecodeCategorys], mockData: CategoryDatasProtocol, router: RouterProtocol!, id: Int, network: NetworkLayerProtocol) {
        self.view = view
        self.router = router
        self.arr = selectArr
        self.mockData = mockData
        self.id = id
        self.network = network
        
        setAllStorys()
        addCategorys()
    }
    
    func addIdinRealm(){
        
        var idRealm = RealmDataBase(value: [0, id])
        
        try! SelectPresenter.realm.write(){
            SelectPresenter.realm.add(idRealm)
            
        }
    }
    
    func setArr() {
        view.setSelectArr(arr: arr)
    }
    func setId() {
        view.setId(id: id)
    }
    func addSelectId() -> [Int] {
        var arrId = [Int]()
        for i in 0...arr.count - 1{
            arrId.append(arr[i].id)
        }
        return arrId
    }
    func tapOncontinuButton() {
        
        SelectPresenter.items = SelectPresenter.realm.objects(RealmDataBase.self)
        
        print(SelectPresenter.items[0].registrationInfo)
        print(SelectPresenter.items[3].registrationInfo)
        print(SelectPresenter.items.count)
        
        setCources()
        addIdinRealm()
        router.createMainAplicationControll(arr: allCources)
    }
    
    func tapOnBackButton() {
        router.popController()
    }
    func addPost(userId: Int, categorysId: [Int]) {
        network.pushCategorys(userId: userId, categorisId: categorysId) { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(var reginfo):
                    self.regInfo.registrationInfo = (reginfo.user?.registered)!
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func addCategorys(){
        network.addAllCources() { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let categorys):
                    self.firstCategorys = .firstSection(categorys)
                    //print(self.firstCategorys.count)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func setAllStorys(){
        network.addSyorys(id: String(id)) { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(let storysArr):
                    self.allStorys = .storys(storysArr)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    
    func setCources() {
        allCources = [allStorys ,firstCategorys]
    }

}
