import Foundation

protocol MailViewProtocol: AnyObject{
    
}
protocol MailPresenterProtocol{
    init(view: MailViewProtocol, mailDatas: MailModel, router: RouterProtocol, networkLayer: NetworkLayerProtocol)
    var mailDatas: MailModel! {get set}
    var mail: String! {get set}
    func tapOnContinumButton()
    func tapOnPopButton()
    func getMail(mail: String)
    
}
class MailPresenter: MailPresenterProtocol{
    
    var mail: String!
    weak var view: MailViewProtocol!
    var router: RouterProtocol!
    var mailDatas: MailModel!
    var networkLayer: NetworkLayerProtocol!
    
    required init(view: MailViewProtocol, mailDatas: MailModel, router: RouterProtocol, networkLayer: NetworkLayerProtocol) {
        self.view = view
        self.mailDatas = mailDatas
        self.router = router
        self.networkLayer = networkLayer
    }
    
    func tapOnContinumButton() {
        router.createCompareControll(mail: mail)
    }
    func tapOnPopButton() {
        router.popToRoot()
    }
    func getMail(mail: String) {
        networkLayer.throwMail(email: mail)
    }
    
}
