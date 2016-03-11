//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Jeremie Lim on 3/9/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [NSDictionary]!
    var names: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 320
        tableView.delegate = self
        tableView.dataSource =  self
        
        photos = []
        
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

                            // Store the returned array of media in your photos property
                            self.photos = responseDictionary["data"] as! [NSDictionary]
                            self.tableView.reloadData()
                           
                    }
                }
        });
        
        task.resume()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotosCell") as! PhotosTableViewCell
        
        let photo = photos[indexPath.row]

        let username = photo.valueForKeyPath("user.username") as! String
        let urlString = photo.valueForKeyPath("images.low_resolution.url") as! String
        
        print(urlString)
        
        cell.cellImageView.setImageWithURL(NSURL(string: urlString)!)
//        print(urlString)
//        cell.cellImageView.setImageWithURL(NSURL(string: urlString));)
        
        
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

