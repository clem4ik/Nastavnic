import Foundation
struct CategoryDatas{
    let title: String
    var select = false
    let id: Int
}
protocol CategoryDatasProtocol{
    func addArr()->[CategoryDatas]
}
class CategorysMockDatas: CategoryDatasProtocol{
    
    func addArr() -> [CategoryDatas] {
        [
            .init(title: "Zxcz", select: false, id: 0),
            .init(title: "QweSrt", select: false, id: 1),
            .init(title: "Xdfds", select: false, id: 2),
            .init(title: "Cdsfdsfds", select: false, id: 3),
            .init(title: "Edsfds", select: false, id: 4),
            .init(title: "Ddsfsdfsd", select: false, id: 5),
            .init(title: "Bdsf", select: false, id: 6),
            .init(title: "Pdsfsd", select: false, id: 7),
            .init(title: "xzczxc", id: 8),
            .init(title: "erweopra", id: 9),
            .init(title: "erweopra", id: 10),
            .init(title: "erweopra", id: 11),
            .init(title: "erweopra", id: 12),
            .init(title: "erweopra", id: 13),
            .init(title: "Zxcz", select: false, id: 14),
            .init(title: "QweSrt", select: false, id: 15),
            .init(title: "Xdfds", select: false, id: 16),
            .init(title: "Cdsfdsfds", select: false, id: 17),
            .init(title: "Edsfds", select: false, id: 18),
            .init(title: "Ddsfsdfsd", select: false, id: 19),
            .init(title: "Bdsf", select: false, id: 20),
            .init(title: "Pdsfsd", select: false, id: 21),
            .init(title: "xzczxc", id: 22),
            .init(title: "erweopra", id: 23),
            .init(title: "erweopra", id: 24)
        ]
    }
    
    
}
