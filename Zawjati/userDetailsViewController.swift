//
//  userDetailsViewController.swift
//  Zawjati
//
//  Created by Mohamad Kaakati on 12/5/15.
//  Copyright © 2015 Mohamad Kaakati. All rights reserved.
//

import UIKit

class userDetailsViewController: UIViewController {
    
    @IBOutlet weak var userNameLBL: UILabel!
    
    var userNameDisplay : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // userNameLBL.reloadInputViews()

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        userNameLBL.text = userNameDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
