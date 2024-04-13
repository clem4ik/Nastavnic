import Foundation

class GetCategorys{
    static let sgared = GetCategorys()
    var allArray: [DecodeCategorys]!
    let network = NetworkLayer()
    
    func getAllCategory(){
        network.getAllCAtegorys { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(var allArr):
                    self.allArray = allArr
                    print(self.allArray.count)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
