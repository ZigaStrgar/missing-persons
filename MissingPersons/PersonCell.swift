//
//  PersonCell.swift
//  MissingPersons
//
//  Created by Ziga Strgar on 10/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImg: UIImageView!
    var person: Person!
    
    func configureCell(person: Person) {
        self.person = person
        if let url = NSURL(string: person.imageUrl) {
            downloadImage(url)
        }
    }
    
    func setSelected() {
        personImg.layer.borderWidth = 2.0
        personImg.layer.borderColor = UIColor.yellowColor().CGColor
        
        self.person.downloadFaceId()
    }
    
    func downloadImage(url: NSURL) {
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.personImg.image = UIImage(data: data)
                self.person.personImage = self.personImg.image
            }
        }
    }
    
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
        }.resume()
        
    }
}
