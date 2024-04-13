import Foundation
import UIKit

enum AplicationSection{
    case storys([DecodeCources])
    case firstSection([DecodeCources])
    
    var items: [DecodeCources]{
        switch self{
        case    .storys(let items),
                .firstSection(let items):
            return items
        }
        var count: Int{
            items.count
        }
        
        var title: String{
            switch self{
            case .firstSection(_):
                return ""
            case .storys(_):
                return ""
            }
        }
    }
}
