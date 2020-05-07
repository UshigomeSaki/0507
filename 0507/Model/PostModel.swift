//
//  PostModel.swift
//  0507
//
//  Created by ASW-研修１ on 2020/05/07.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase

class PostModel{
    fileprivate static let PATH : String = "post"
    var description :String = String()
    var id :String = String()
}

extension PostModel{
    static func setParameter(request:PostModel) -> [String:Any]{
        var parameter :[String:Any]=[:]
        parameter["description"] = request.description
        parameter["id"] = request.id
        return parameter
    }
}

//MARK: Create
extension PostModel{
    static func create(request:PostModel,success:@escaping() -> Void){
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key{
            request.id = key
        }
        let parameter = setParameter(request:request)
        dbRef.setValue(parameter)
        success()
        }
}
