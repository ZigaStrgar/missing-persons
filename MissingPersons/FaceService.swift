//
//  FaceService.swift
//  MissingPersons
//
//  Created by Ziga Strgar on 10/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import Foundation
import ProjectOxfordFace

class FaceService {
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "92cec08b2a244a65a205955999733b89")
}