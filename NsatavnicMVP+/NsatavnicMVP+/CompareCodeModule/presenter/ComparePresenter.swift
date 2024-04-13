import Foundation

protocol CompareControllerProtocol{
    func setMail(mail: String)
}

protocol ComparePresenterProtocol{
    init(view: CompareControllerProtocol, router: RouterProtocol, networkLayer: NetworkLayerProtocol, mail: String)
    func getCode(mail: String, code: String)
    var data: String! {get set}
    func setMail()
    var mail: String! {get set}
    func tapOnCheckCode()
    var id: Int! {get set}
    static var arrData: Int! {get set}
}
class ComparePresenter: ComparePresenterProtocol{
    
    static var arrData: Int!
    var data: String!
    var view: CompareControllerProtocol!
    var router: RouterProtocol!
    var network: NetworkLayerProtocol!
    var mail: String!
    var id: Int!
    
    required init(view: CompareControllerProtocol, router: RouterProtocol, networkLayer: NetworkLayerProtocol, mail: String) {
        self.view = view
        self.router = router
        self.network = networkLayer
        self.mail = mail
    }
    
    func getCode(mail: String, code: String) {
    
        network.compareUserCode(email: mail, code: code, compliton: {[weak self] result in
            guard let self = self else {return}
           
            DispatchQueue.main.async {
                switch result{
                case .success(let data):
                    self.data = data.error
                    ComparePresenter.arrData = data.user?.id
                    self.id = data.user?.id
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
    func tapOnCheckCode() {
        router.createThree(id: id)
    }
    func setMail() {
        view.setMail(mail: mail)
    }
}
