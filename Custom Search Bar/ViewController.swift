//
//  ViewController.swift
//  Custom Search Bar
//
//  Created by Darren Kent on 1/17/18.
//  Copyright © 2018 Darren Kent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomSearchControllerDelegate {

    @IBOutlet weak var uxSearchContainer: UIView!
    @IBOutlet weak var uxItemsLabel: UILabel!
    @IBOutlet weak var uxResultsLabel: UILabel!
    
    var customSearchController: CustomSearchController!
    var customSearchBar: CustomSearchBar!
    
    var shouldUseSearchResults:Bool = false
    
    var items:[String] = ["Red", "Green", "Blue", "Pink", "White", "Purple", "Orange", "Yellow", "Gray", "Black"]
    
    var filteredItems:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupCustomSearchController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        let text:String = items.joined(separator: ", ")
        uxItemsLabel.text = text
        uxResultsLabel.text = ""
        uxSearchContainer.layer.cornerRadius = 5
        uxSearchContainer.clipsToBounds = true
    }
    
    func setupCustomSearchController() {
        
        //Make adjustments to the UITextField in CustomSearchBar draw().
        let frame = CGRect(x: 0.0, y: 0.0, width: uxSearchContainer.frame.size.width, height: uxSearchContainer.frame.size.height)
        
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: frame)
        customSearchController.customDelegate = self
        customSearchController.dimsBackgroundDuringPresentation = false
        customSearchBar = customSearchController.customSearchBar
        
        uxSearchContainer.addSubview(customSearchBar)
    }

    // MARK: - CustomSearchController Protocol
    
    func customSearchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        if searchBar == customSearchBar{
            
            searchBar.text = ""
            uxResultsLabel.text = ""
        }
    }
    
    func customSearchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        if searchBar == customSearchBar{
            
            searchBar.text = ""
            uxResultsLabel.text = ""
        }
    }
    
    //Search button is the same as return button.
    func customSearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        customSearchController.closeKeyboard()
    }
    
    func customSearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty && shouldUseSearchResults{
            
            shouldUseSearchResults = false
            
        }else if !searchText.isEmpty && !shouldUseSearchResults{
            
            shouldUseSearchResults = true
        }
        
        //FILTER
        filteredItems = items.filter{ $0.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil}
        
        //SORT
        filteredItems?.sort(by: {$0 < $1})
        //OR
        //filteredItems = filteredItems?.sorted()
        //filteredItems = filteredItems?.sorted{ $0 < $1 }
        //filteredItems = filteredItems?.sorted(by: {$0 < $1})
        
        if shouldUseSearchResults{
            
            if filteredItems != nil && !(filteredItems?.isEmpty)!{
                
                let text:String = filteredItems!.joined(separator: ", ")
                uxResultsLabel.text = text
                
            }else{
                
                uxResultsLabel.text = "NO RESULTS"
            }
            
        }else{
            
            uxResultsLabel.text = "NO RESULTS"
        }
        
        
        //FILTERING AND SORTING WITH PROPERTIES
        //Example (.itemName)
        
        //filteredItems = items.filter{ $0.itemName.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil}
        
        //filteredItems = items.sorted(by: {$0.itemName < $1.itemName})
        //OR TO SORT IN PLACE
        //filteredItems?.sort(by: {$0.itemName < $1.itemName})
    }

}

