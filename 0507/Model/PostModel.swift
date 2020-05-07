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
    var description: String = String()
    var id :String = String()
}

extension PostModel{
    static func parse(data:[String:Any]) -> PostModel{
       let model : PostModel = PostModel()
       if let id = data["id"]as? String{model.id = id}
       if let description = data["description"]as? String{model.description = description }
       return model
   }
   static func setParameter(request:PostModel) -> [String:Any]{
       var parameter : [String:Any] = [:]
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

//MARK: Read
extension PostModel{
    static func reads(success:@escaping([PostModel]) -> Void){
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value) { snapshot in
            var models: [PostModel] = [PostModel]()
            for item in (snapshot.children){
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String:Any]
                let model : PostModel = parse(data:data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        }
    }
}

