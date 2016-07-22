//
//  Person.swift
//  MissingPersons
//
//  Created by Ziga Strgar on 10/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import Foundation
import UIKit
import ProjectOxfordFace

class Person {
    var faceId: String?
    var personImage: UIImage?
    var personImageUrl: String?
    
    var imageUrl: String {
        return baseURL + personImageUrl!
    }
    
    let baseURL = "http://localhost:6069/img/"
    
    init(personImageUrl: String) {
        self.personImageUrl = personImageUrl
    }
    
    func downloadFaceId() {
        if let image = personImage, let imgData = UIImageJPEGRepresentation(image, 0.8) {
            FaceService.instance.client.detectWithData(imgData, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock: { (faces:[MPOFace]!, err: NSError!) in
                if err == nil {
                    var faceId: String?
                    for face in faces {
                        faceId = face.faceId
                        break
                    }
                    
                    self.faceId = faceId
                }
            })
        }
    }
}