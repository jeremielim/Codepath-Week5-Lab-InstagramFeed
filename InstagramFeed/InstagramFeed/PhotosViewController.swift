//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Jeremie Lim on 3/9/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 320
        tableView.delegate = self
        tableView.dataSource =  self
        
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
                            self.photos = responseDictionary["data"] as! [NSDictionary]
                    }
                }
        });
        task.resume()
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotosCell")
        
        return cell!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

