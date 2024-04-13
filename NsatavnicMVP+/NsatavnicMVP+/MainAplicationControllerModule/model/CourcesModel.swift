//
//  CourcesModel.swift
//  NsatavnicMVP+
//
//  Created by Лев Суханов on 28.03.2024.
//

import Foundation
import UIKit

protocol DecodeCourcesProtocol{
    var active: Int? { get set }
    var avatar: String? { get set }
    var cost: String? { get set }
    var create_date: String? { get set }
    var description: String? { get set }

    var mentor_id: Int? { get set }
    var name: String? { get set }
}

struct DecodeCources: Decodable{
    var id: Int?
    var name: String?
    var active: Int?
    var select_av: Int?
    var mentor_id: Int?
    var cost: String?
    var create_date: String?
    var description: String?
    var avatar: String?
    var checked_stories_by_user: Bool?
}

