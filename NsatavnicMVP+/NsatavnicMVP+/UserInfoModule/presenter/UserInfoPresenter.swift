import Foundation

protocol UserInfoControllerProtocol: AnyObject{
    func setId(id: Int)
}
protocol UserInfoPresenterProtocol{
    init(view: UserInfoControllerProtocol, model: UserInfoDatas, router: RouterProtocol, networkLayer: NetworkLayerProtocol, id: Int)
    var userInfoDatas: UserInfoDatas! {get set}
    func tapOnNotificationButton()
    func tapOncontinuButton()
    var networkLayer: NetworkLayerProtocol! {get set}
    var id: Int! {get set}
    func setId()
    func getID(name: String, gender: String, id2: Int)
}
class UserInfoPresenter: UserInfoPresenterProtocol{

    var userInfoDatas: UserInfoDatas!
    weak var view: UserInfoControllerProtocol!
    var router: RouterProtocol!
    var networkLayer: NetworkLayerProtocol!
    var id: Int!
    
    required init(view: UserInfoControllerProtocol, model: UserInfoDatas, router: RouterProtocol, networkLayer: NetworkLayerProtocol, id: Int) {
        self.view = view
        self.userInfoDatas = model
        self.router = router
        self.networkLayer = networkLayer
        self.id = id
    }
    func tapOnNotificationButton() {
        
    }
    func tapOncontinuButton() {
        router.createFour(id: id)
    }
    func getID(name: String, gender: String, id2: Int) {
        networkLayer.pushUserInfo(name: name, gender: gender, id: id2)
    }
    func setId(){
        view.setId(id: id)
    }
   
}
