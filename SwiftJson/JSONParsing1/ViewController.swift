//
//  ViewController.swift
//  JSONParsing1
//
//  Created by Harikrishna on 3/3/15.
//  Copyright (c) 2015 paradigmCreatives. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String = "http://date.jsontest.com"
        let url = NSURL(string: urlString)!
        let urlSession = NSURLSession.sharedSession()
        
        let urlString2: String = "http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo"
        let url2 = NSURL(string: urlString2)
        let urlSession2 = NSURLSession.sharedSession()
        
        let jsonQuery2 = urlSession2.dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
            if(error2 != nil)
            {
                println(error2.localizedDescription)
            }
            var error2: NSError?
            var jsonResult2 = NSJSONSerialization.JSONObjectWithData(data2, options: NSJSONReadingOptions.MutableContainers, error: &error2) as NSDictionary
            println(jsonResult2.allKeys)
            
            for (key, value) in jsonResult2 {
                println("\(key) -> \(value)")
            }

            
        })
        
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            if (error != nil)
            {
                println("\(error.localizedDescription)")
            }
            var error: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
            println(jsonResult)
            let jsonDate = jsonResult["date"] as NSString?
            let jsonTime = jsonResult["time"] as NSString?
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.dateLabel.text = jsonDate!
                self.timeLabel.text = jsonTime!
            })
            
        })
        jsonQuery.resume()
        jsonQuery2.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    //this is testing

}

