//
//  ViewController.swift
//  Zawjati
//
//  Created by Mohamad Kaakati on 12/5/15.
//  Copyright © 2015 Mohamad Kaakati. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    // Set The eNum to Fix Cell Sizing Issues with all iPhone Models
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    var fromVCuserName : String!
    var fromVCuserAge : String!
    var fromVCuserCountry : String!
    var fromVCuserGender : String!
    var fromVCuserStatus : String!
    var fromVCuserTall : String!
    var fromVCuserWeight : String!
    var fromVCuserIMG1 : String!
    var fromVCuserIMG2 : String!
    var fromVCuserIMG3 : String!
    var fromVCuserIMG4 : String!
    
    // An Outlet to the CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Cell Identifier to use with the method down below.
    var reuseIdentifier = "cell"
    
    // Users Array "DEMO"
    var userCollection = ["Jessica", "Anna", "AmyLee", "Rose", "Amanda", "Stephany", "Linda", "Suzan", "Lamia", "Olivia", "Estella", "Jenny", "Rihana", "Guadalupe", "Esperanza", "Miranda", "Sehllis", "Christy", "AnnaRose", "Ambrose", "Sandra","Jessica", "Anna", "AmyLee", "Rose", "Amanda", "Stephany", "Linda", "Suzan", "Lamia", "Olivia", "Estella", "Jenny", "Rihana", "Guadalupe", "Esperanza", "Miranda", "Sehllis", "Christy", "AnnaRose", "Ambrose", "Sandra"]
    
    var userAgeCollection = ["22", "18", "19", "24", "31", "33", "43", "29", "55", "24", "24", "27", "47", "34", "30", "31", "36", "38", "29", "43", "44","46", "25", "27", "28", "18", "18", "20", "21", "22", "26", "26", "31", "32", "34", "36", "28", "37", "38", "40", "41", "39"]
    
    var thumbNailImage : String = "https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png"
    
    // If you want to give each cell a deffirent Image, Replace the URLs below.
    
    var userThumbnail = ["https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png","https://cdn4.iconfinder.com/data/icons/e-commerce-5/512/Avatar_Woman-3-512.png",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set The Title of the View
        navigationController?.title = "GLOBAL"
        
        // Reload The Collection View Data
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(userCollection.count)
        return userCollection.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! userCell
        
//        cell.userCellAge.layer.cornerRadius = 4.0
//        cell.userCellAge.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        cell.backgroundColor = UIColor.lightGrayColor()
        cell.userCellName.text = self.userCollection[indexPath.row]
        cell.userCellAge.text = self.userAgeCollection[indexPath.row]
        
        
        // Create Online OR Offline Circle
        cell.OnOffIndicator.layer.cornerRadius = cell.OnOffIndicator.frame.size.width / 2;
        cell.OnOffIndicator.clipsToBounds = true;
        cell.OnOffIndicator.backgroundColor = UIColor.greenColor()
        // let userPhoto = UIImage(named: "Avatar")
        
        cell.userCellPhoto.image = UIImage(named: "Avatar")
        
        var imgURL = "https://cdn2.iconfinder.com/data/icons/avatar-2/512/iri_girl_face-512.png"
        
        // Configure the cell
        
        return cell
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        fromVCuserName = self.userCollection[indexPath.row]
        
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        fromVCuserName = self.userCollection[indexPath.row]
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "userDetails") {
            // pass data to next view
            if let viewController: userDetailsViewController = segue.destinationViewController as? userDetailsViewController {
                viewController.userNameDisplay = fromVCuserName
            }
        }
        
    }
    
    
    
    
    // Fix the Cell Size for iPhone Devices
    
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            if DeviceType.IS_IPHONE_6P {
                // Set cell width to 100%
                let collectionViewWidth = self.collectionView.bounds.size.width / 4
                return CGSize(width: 100, height: 100)
            } else
                if DeviceType.IS_IPHONE_6 {
                    // Set cell width to 100%
                    let collectionViewWidth = self.collectionView.bounds.size.width / 4
                    return CGSize(width: 90, height: 90)
                    
                } else
                    if DeviceType.IS_IPHONE_5 {
                        // Set cell width to 100%
                        let collectionViewWidth = self.collectionView.bounds.size.width / 4
                        return CGSize(width: 100, height: 100)
                        
                        
            }
            
            let collectionViewWidth = self.collectionView.bounds.size.width / 4
            return CGSize(width: 100, height: 100)
    }
    
    //Use for interspacing
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 2.0
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    
}

