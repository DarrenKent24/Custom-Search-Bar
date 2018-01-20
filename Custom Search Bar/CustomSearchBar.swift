//
//  CustomSearchBar.swift
//  Custom Search Bar
//
//  Created by Darren Kent on 1/17/18.
//  Copyright © 2018 Darren Kent. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        self.searchBarStyle = UISearchBarStyle.prominent
        self.isTranslucent = false
        self.backgroundColor = UIColor.clear
        self.barTintColor = UIColor.clear
        self.tintColor = UIColor.darkGray
        
        self.showsBookmarkButton = false
        self.showsCancelButton = false
        self.showsSearchResultsButton = false
        self.showsScopeBar = false
        
        self.autocapitalizationType = .sentences
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.keyboardAppearance = .dark
        self.returnKeyType = .default
        self.enablesReturnKeyAutomatically = false
        
        //Remove border lines by setting the backgroundImage as a clear image.
        //Create a clear image and set as the background.
        //Image is stretched or tiled.
        self.backgroundImage = clearImage(size: CGSize(width: 10.0, height: 10.0))
        
        //OR
        //Cover the border lines with a solid color view.
        /*
        let coverView = UIView()
        coverView.backgroundColor = UIColor.yellow
        coverView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.addSubview(coverView)*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func clearImage(size: CGSize) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        
        let searchBarView = subviews[0]
        
        var searchTextField:UITextField?
        
        //This is the outer background behind the UITextfield.
        searchBarView.subviews[0].backgroundColor = UIColor.purple
        
        //Find the search field in the search bar subviews.
        for view in searchBarView.subviews{
            
            //Unlike the "is" operator, "isKind" can be used to check the exact type, without consideration for subclasses.
            if view.isKind(of: UITextField.self){
                //This is the one it finds -> searchBarView.subviews[1]
                searchTextField = view as? UITextField
                break
            }
        }
        
        if searchTextField != nil{
            
            //Set the searchTextField frame to be a bit smaller than the searchBarView.
            searchTextField!.frame = CGRect(x: 5.0, y: 5.0, width: self.frame.size.width - 10.0, height: self.frame.size.height - 10.0)
            
            //Layers disappear on layout and would need to be added again.
            //Rounded corners could be applied to the container in the ViewController.
            
            //Or set the borderStyle property.
            //.none .line .bezel .roundedRect
            searchTextField!.borderStyle = .roundedRect
            
            //Set the placeholder, font and text color.
            let placeholderColor = UIColor.lightGray
            searchTextField?.attributedPlaceholder = NSAttributedString(string: "SEARCH", attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
            
            searchTextField!.font = UIFont(name: "HelveticaNeue", size: 22.0)
            searchTextField!.textColor = UIColor.darkGray
            
            //Set the background color of the searchTextField.
            searchTextField!.backgroundColor = UIColor.white
            
            //To remove the magnifying glass.
            //searchTextField!.leftView = nil
            
        }
        
        super.draw(rect)
    }

}
