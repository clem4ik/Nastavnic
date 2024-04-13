import Foundation

protocol NetworkLayerProtocol{
    func throwMail(email: String)
    func throwUserInfo(name: String, hender: String, category: String)
    func compareUserCode(email: String, code: String, compliton: @escaping (Result<dec, Error>)->())
    func pushUserInfo(name: String, gender: String?, id: Int)
    func getAllCAtegorys(complition: @escaping (Result<[DecodeCategorys], Error>)->())
    func pushCategorys(userId: Int, categorisId: [Int], complition: @escaping (Result<dec, Error>)->())
    func addAllCources(complition: @escaping (Result<[DecodeCources], Error>)->())
    func addSyorys(id: String, complition: @escaping (Result<[DecodeCources], Error>)->())
}
class NetworkLayer: NetworkLayerProtocol{
    
    func throwMail(email: String){
        let urlString = "https://nastavnikapp.ru/oauth/provider"
        guard let url = URL(string: urlString) else {return}
        let parametrs = ["email": email, "provider": "email"]
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs) else {return}
        reqest.httpBody = httpBody
        
        let sessin = URLSession.shared
        sessin.dataTask(with: reqest) { data, response, error in
            if let response = response{
                print(response)
            }
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
                
            }catch{
                print(error)
            }
        }.resume()
        
    }
    
    func throwUserInfo(name: String, hender: String, category: String) {
        let urlString = "https://nastavnikapp.ru/oauth/provider"
        guard let url = URL(string: urlString) else{return}
        
        var parametrs = ["name": name, "hender": hender, "category": category]
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs) else{return}
        reqest.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: reqest) { data, response, error in
            if let response = response{
                print(response)
            }
            guard let data = data else{return}
            do{
                let json = try JSONSerialization.data(withJSONObject: data)
                print(json)
            }catch let error as NSError{
                print(error)
            }
        }
    }
    func compareUserCode(email: String, code: String, compliton: @escaping (Result<dec, Error>)->()) {
        
        let urlString = "https://nastavnikapp.ru/oauth/codeCheck"
        guard let url = URL(string: urlString) else {return}
        let parametrs = ["email": email, "code": code]
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs) else {return}
        reqest.httpBody = httpBody
        
        let sessin = URLSession.shared
        sessin.dataTask(with: reqest) { data, response, error in
            if let response = response{
                print(response)
            }
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
                
            }catch let error as NSError{
                print(error)
            }
            do{
                let anserw = try JSONDecoder().decode(dec.self, from: data)
                compliton(.success(anserw))
                
            }catch{
                compliton(.failure(error))
            }
            
        }.resume()
    }
    func pushUserInfo(name: String, gender: String?, id: Int) {
        let urlString = "https://nastavnikapp.ru/oauth/adinfo"
        guard let url = URL(string: urlString) else{return}
        let userDatas = ["name": name, "gender": gender]
        let secondData = ["id": id]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httbBody = try? JSONSerialization.data(withJSONObject: [userDatas, secondData]) else{return}
        request.httpBody = httbBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, responce, error in
            if let responce = responce{
                print(responce)
            }
            guard let data = data else{return}
            do{
                let jason = try JSONSerialization.jsonObject(with: data)
                print(jason)
            }catch let error as NSError{
                print(error)
            }
        }.resume()
    }
    
    
    func getAllCAtegorys(complition: @escaping (Result<[DecodeCategorys], Error>)->()) {
        let urlString = "https://nastavnikapp.ru/categories/get"
        guard let url = URL(string: urlString) else{return}
        var reqtst = URLRequest(url: url)
        reqtst.httpMethod = "POST"
        reqtst.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let datasArray = ["type": "getAllCatigories"]
        
        guard let httbBody = try? JSONSerialization.data(withJSONObject: datasArray) else{return}
        reqtst.httpBody = httbBody
        
        let session = URLSession.shared
        session.dataTask(with: reqtst) { data, responce, error in
            if let responce = responce{
                print(responce)
            }
            guard let data = data else{return}
            do{
                let jason = try JSONSerialization.jsonObject(with: data)
            }catch let error as NSError{
                print(error)
            }
            do{
                let anserw = try JSONDecoder().decode([DecodeCategorys].self, from: data)
                complition(.success(anserw))
            }catch let error as NSError{
                complition(.failure(error))
            }
        }.resume()
    }
    
    func pushCategorys(userId: Int, categorisId: [Int], complition: @escaping (Result<dec, Error>)->()) {
        let urlString = "https://nastavnikapp.ru/oauth/adcatig"
        guard let url = URL(string: urlString) else{return}
        
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        let dataArr = ["id": userId]
        let secondData = ["category_id": categorisId]
        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: [dataArr, secondData]) else{return}
        reqest.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: reqest) { data, responce, error in
            if let responce = responce{
                print(responce)
            }
            guard let data = data else{return}
            do{
                let jason = try JSONSerialization.jsonObject(with: data)
                print(jason)
                
            }catch let error as NSError{
                print(error)
            }
            do{
                let anserw = try JSONDecoder().decode(dec.self, from: data)
                complition(.success(anserw))
            }catch let error as NSError{
                complition(.failure(error))
            }
        }.resume()
    }
    func addAllCources(complition: @escaping (Result<[DecodeCources], Error>)->()) {
        let urlString = "https://nastavnikapp.ru/courses/get"
        guard let url = URL(string: urlString) else {return}
        
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        var postData = ["type": "getAll"]
        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postData) else{return}
        reqest.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: reqest) { data, responce, error in
            if let responce = responce{
                print(responce)
            }
            guard let data = data else{return}
            do{
                let jason = try JSONSerialization.jsonObject(with: data)
                print(jason)
            }catch let error as NSError{
                print(error)
            }
            do{
                let anserw = try JSONDecoder().decode([DecodeCources].self, from: data)
                complition(.success(anserw))
                
            }catch let error as NSError{
                complition(.failure(error))
            }
        }.resume()
    }
    
    func addSyorys(id: String, complition: @escaping (Result<[DecodeCources], Error>) -> ()) {
        let urlStrig = "https://nastavnikapp.ru/story/get"
        guard let url = URL(string: urlStrig) else {return}
        let post = ["type" : "getAll", "user_id": id]
        
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "POST"
        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httbBody = try? JSONSerialization.data(withJSONObject: post) else {return}
        reqest.httpBody = httbBody
        
        let session = URLSession.shared
        session.dataTask(with: reqest) { data, responce, error in
            if let responce = responce{
                print(responce)
            }
            guard let data = data else{return}
            
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }catch let error as NSError{
                print(error)
            }
            
            do{
                let anserw = try JSONDecoder().decode([DecodeCources].self, from: data)
                complition(.success(anserw))
            }catch let error as NSError{
                complition(.failure(error))
            }
        }.resume()
    }
}
