import Foundation

protocol CategoryControllerProtocol: AnyObject{
    func setId(id: Int)
}
protocol CategoryPresenterProtocol{
    init(view: CategoryControllerProtocol, categoryDatas: CategoryDatasProtocol, router: RouterProtocol, network: NetworkLayerProtocol, id: Int)
    var allArray: [DecodeCategorys]! {get set}
    var selectArr: [DecodeCategorys]! {get set}
    var id: Int! {get set}
    func tapOnButton()
    func setSelectedArr(allArr: [DecodeCategorys])->[DecodeCategorys]
    func setAllArr()
    func setId()
}
class CategoryPresenter: CategoryPresenterProtocol{
    var selectArr: [DecodeCategorys]!
    var allArray: [DecodeCategorys]!
    weak var view: CategoryControllerProtocol!
    var mockData: CategoryDatasProtocol
    var router: RouterProtocol
    let network: NetworkLayerProtocol!
    var id: Int!
    
    required init(view: CategoryControllerProtocol, categoryDatas: CategoryDatasProtocol, router: RouterProtocol, network: NetworkLayerProtocol, id: Int) {
        self.view = view
        self.mockData = categoryDatas
        self.router = router
        self.network = network
        self.id = id
        setAllArr()
    }
    func setAllArr(){
        network.getAllCAtegorys { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(var allArr):
                    self.allArray = allArr
                    print(self.allArray.count)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func setSelectedArr(allArr: [DecodeCategorys])->[DecodeCategorys] {
        var selectedArr = [DecodeCategorys]()
        for i in 0...allArr.count-1{
            if allArr[i].select_av == 1{
                selectedArr.append(allArr[i])
            }
        }
        selectArr = selectedArr
        return selectedArr
    }
    func tapOnButton() {
        router.createSelectCategoryControll(arr: selectArr, id: id)
    }
    func setId() {
        view.setId(id: id)
    }
    
}
