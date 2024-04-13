import Foundation

protocol MockDatasProtocol: AnyObject{
    func returnArrayDatas()->[RegisterDatas]
}

class MockDatas: MockDatasProtocol{
    func returnArrayDatas() -> [RegisterDatas] {
        [
            .init(image: "Apple", label: "Apple"),
            .init(image: "Google", label: "Google"),
            .init(image: "VK", label: "VK"),
            .init(image: "Mail", label: "Почта")
        ]
    }
}
