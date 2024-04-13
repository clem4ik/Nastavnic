import Foundation

struct DecodeCategorys: Decodable{
    let id: Int
    let name: String
    var active: Int
    var select_av: Int = 0
}
