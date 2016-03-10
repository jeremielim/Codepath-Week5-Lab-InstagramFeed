//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Jeremie Lim on 3/9/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var photos: [NSDictionary] = []
        
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=e05c462ebd86446ea48a5af73769b602")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (data, response, error) in
                if let data = data {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            print("responseDictionary: \(responseDictionary)")
                            // Store the returned array of media in your photos property
                    }
                }
        });
        task.resume()
        
        self.photos = responseDictionary["data"] as! [NSDictionary] 
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

