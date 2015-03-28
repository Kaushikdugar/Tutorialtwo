//
//  ViewController.swift
//  Tutorialtwo
//
//  Created by Kaushik Dugar on 25/03/15.
//  Copyright (c) 2015 Kaushik Dugar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var datestring : String!
    
    @IBOutlet weak var textfield: UITextField!
    @IBAction func button(sender: AnyObject, forEvent event: UIEvent) {
        let a=textfield.text;        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8888/tutorialtwo.php")!)
        request.HTTPMethod = "POST"
        var postString = "dob="+datestring+"&usn="+a
        println(postString);
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=\(error)")
                return
            }
            
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
        }
        task.resume()

    }
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBAction func datePickerAction(sender: AnyObject) {
        
        
        var dateFormatter1 = NSDateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd"
        var strDate = dateFormatter1.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
        datestring = strDate
       
    }
    
    
    override func viewDidLoad() {
        
        /*let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8888/tutorialtwo.php")!)
        request.HTTPMethod = "POST"
        let postString = "name=AASHRIT SHANKAR"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=\(error)")
                return
            }
            
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
        }
        task.resume()*/
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

