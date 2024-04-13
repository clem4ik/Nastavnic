import Foundation
import UIKit

protocol AssamblyBuilderProtocol{
    func createController(router: RouterProtocol)->UIViewController
    func createSecondController(router: RouterProtocol)->UIViewController
    func createUserInfoController(router: RouterProtocol, id: Int)->UIViewController
    func createCategoryController(router: RouterProtocol, id: Int)->UIViewController
    func createSelectController(router: RouterProtocol, arr: [DecodeCategorys], id: Int)->UIViewController
    func createMainAplicationController(router: RouterProtocol, arr: [AplicationSection])->UIViewController
    func createMenueController(router: RouterProtocol)-> UIViewController
    func createCompareCodeControll(router: RouterProtocol, mail: String)->UIViewController
    func createCourcesControll(router: RouterProtocol)->UIViewController
    func createLoadController(router: RouterProtocol)->UIViewController
}
class AssamblyBuilder: AssamblyBuilderProtocol{
    
    func createController(router: RouterProtocol) -> UIViewController {
        let labels = LabelDatas(upLabel: "Наставник", mainLabel: "Качай свои навыки достигай своих целей", aurorizationLabel: "Авторизация")
        let view = RegisterController()
        let model = MockDatas()
        let presenter = RegisterPresenter(view: view, mockData: model, router: router, labels: labels)
        view.presenter = presenter
        return view
    }
    
    func createSecondController(router: RouterProtocol) -> UIViewController {
        let model = MailModel(upLabel: "Наставник", mailLabel: "Почта", mainLabel: "Введи почту на которую мы отправим ссылку для авторизации", placeholderLabel: "Адрес электронной почты", continumButtonLabel: "Продолжить", popButtonLabel: "Другой способ входа")
        let view = SecondVCViewController()
        let network = NetworkLayer()
        let presenter = MailPresenter(view: view, mailDatas: model, router: router, networkLayer: network)
        view.presenter = presenter
        return view
    }
    func createUserInfoController(router: RouterProtocol, id: Int) -> UIViewController {
        let view = UserInfo()
        let model = UserInfoDatas(upLabel: "Наставник", preMainLabel: "Имя или Псевдоним*", mainLabel: "Введи Своё имя или псевдоним, который будет отображаться для всех", henderLabel: "Пол*", secondMainLabel: "Выберите Свою гендерную принадлежность", notificationLabel: "Получать уведомления", threeMainLabel: "Мы не будем присылать всякий спам. Только то - что вам действительно нужно", titleForNotificationButton: "Нажмите чтобы разрешить", titleForContinuButton: "Продолжить")
        let network = NetworkLayer()
        let presenter = UserInfoPresenter(view: view, model: model, router: router, networkLayer: network, id: id)
        view.presenter = presenter
        return view
    }
    func createCategoryController(router: RouterProtocol, id: Int) -> UIViewController {
        let view = CategoryController()
        let model = CategorysMockDatas()
        let nrtwork = NetworkLayer()
        let presenter = CategoryPresenter(view: view, categoryDatas: model, router: router, network: nrtwork, id: id)
        view.presenter = presenter
        return view
    }
    func createSelectController(router: RouterProtocol ,arr: [DecodeCategorys], id: Int) -> UIViewController {
        let view = SelectCategoryController()
        let model = CategorysMockDatas()
        let network = NetworkLayer()
        let presenter = SelectPresenter(view: view, selectArr: arr, mockData: model, router: router, id: id, network: network)
        view.presenter = presenter
        return view
    }
    func createMainAplicationController(router: RouterProtocol, arr: [AplicationSection]) -> UIViewController {
        let view = MainAplicationController()
        let network = NetworkLayer()
        let presenter = AplicationPresenter(view: view, mockData: nil, router: router, network: network, arr: arr)
        view.presenter = presenter
        return view
    }
    
    func createMenueController(router: RouterProtocol) -> UIViewController {
        let view = MenueController()
        let model = MockMenue()
        let presenter = MenuePresenter(view: view, datasArr: model, router: router)
        view.preseter = presenter
        return view
    }
    func createCompareCodeControll(router: RouterProtocol, mail: String) -> UIViewController {
        let view = CompareCode()
        let network = NetworkLayer()
        let presenter = ComparePresenter(view: view, router: router, networkLayer: network, mail: mail)
        view.presenter = presenter
        return view
    }
    func createCourcesControll(router: RouterProtocol) -> UIViewController {
        let view = CourcesController()
        let model = MockCources()
        let presenter = CourcesPressenter(view: view, model: model, router: router)
        view.presenter = presenter
        return view
    }
    func createLoadController(router: RouterProtocol) -> UIViewController {
        let view = LoadController()
        let network = NetworkLayer()
        let presenter = LoadPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
}
