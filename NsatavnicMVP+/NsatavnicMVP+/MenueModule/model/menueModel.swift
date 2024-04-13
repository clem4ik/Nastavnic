import Foundation

struct MenueModel{
    let image: String
    let title: String
    let secondTitle: String
}
protocol MockMenueProtocol{
    func addArr()->[MenueModel]
}
class MockMenue: MockMenueProtocol{
    func addArr() -> [MenueModel] {
        [
            .init(image: "exclamationmark.circle", title: "Обновление", secondTitle: "Новые функции и бла бла бла бла так далее и тому подобное"),
            .init(image: "exclamationmark.circle", title: "Информация", secondTitle: "Какой то чурбан выкатил новый курс быстрее беги жрать говно за ним" )
        ]
    }
}
