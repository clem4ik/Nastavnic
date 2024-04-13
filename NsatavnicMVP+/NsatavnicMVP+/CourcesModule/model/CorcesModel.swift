import Foundation

struct CourcesModel{
    let recomendation: String
    var blockRecomendation: String
    var allCources: String
    var blockAllCources: String
}
enum CourcesSection{
    case recomendation([CourcesModel])
    case recomendationCources([CourcesModel])
    case all([CourcesModel])
    case allCources([CourcesModel])
    
    var items: [CourcesModel]{
        switch self {
        case .recomendation(let items),
                .recomendationCources(let items),
                .all(let items),
                .allCources(let items):
            return items
        }
    }
    
    var count: Int{
        items.count
    }
    var title: String{
        switch self{
        case .recomendation(_):
            return ""
        case .recomendationCources(_):
            return ""
        case .all(_):
            return ""
        case .allCources(_):
            return ""
        }
    }
    
}
