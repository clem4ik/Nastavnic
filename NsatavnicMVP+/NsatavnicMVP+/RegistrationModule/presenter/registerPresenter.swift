import Foundation

protocol MainViewProtocol: AnyObject{
}
protocol RegisterPresenterProtocol{
    init(view: MainViewProtocol, mockData: MockDatas, router: RouterProtocol, labels: LabelDatas)
    var images: [RegisterDatas]! { get set }
    func settingImages()
    func tapOnTheCell()
    var labels: LabelDatas! { get set }
}
class RegisterPresenter: RegisterPresenterProtocol{
    
    var labels: LabelDatas!
    var images: [RegisterDatas]!
    weak var view: MainViewProtocol!
    var mockData: MockDatasProtocol!
    var router: RouterProtocol!
    
    required init(view: MainViewProtocol, mockData: MockDatas, router: RouterProtocol, labels: LabelDatas) {
        self.view = view
        self.mockData = mockData
        self.router = router
        self.labels = labels
        settingImages()
    }
    func settingImages() {
        images = mockData.returnArrayDatas()
    }
    func tapOnTheCell() {
        router.createSecond()
    }
}
