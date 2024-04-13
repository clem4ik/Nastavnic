import Foundation

protocol MockCourcesProtocol{
    var recomendation: CourcesSection {get set}
    var recomendationCources: CourcesSection {get set}
    var all: CourcesSection {get set}
    var allCources: CourcesSection {get set}
    
    func addCourcesSections()->[CourcesSection]
}
struct MockCources: MockCourcesProtocol{
    
    func addCourcesSections() -> [CourcesSection] {
        let pageData = [recomendation, recomendationCources, all, allCources]
        
        return pageData
    }
    
    var recomendation: CourcesSection = {
        .recomendation([
            .init(recomendation: "Рекомендации", blockRecomendation: "", allCources: "", blockAllCources: "")
        ])
    }()
    
    var recomendationCources: CourcesSection = {
        .recomendationCources([
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: "")
        ])
    }()
    
    var all: CourcesSection = {
        .all([
            .init(recomendation: "Все курсы", blockRecomendation: "", allCources: "", blockAllCources: "")
        
        ])
    }()
    
    var allCources: CourcesSection = {
        .allCources([
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: ""),
            .init(recomendation: "", blockRecomendation: "Блок подборка", allCources: "", blockAllCources: "")
        ])
    }()
    
    
}
