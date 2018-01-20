//
//  CustomSearchController.swift
//  Custom Search Bar
//
//  Created by Darren Kent on 1/17/18.
//  Copyright © 2018 Darren Kent. All rights reserved.
//

protocol CustomSearchControllerDelegate {
    
    func customSearchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    
    func customSearchBarTextDidEndEditing(_ searchBar: UISearchBar)
    
    func customSearchBarSearchButtonClicked(_ searchBar: UISearchBar)
    
    func customSearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String)
}

import UIKit

class CustomSearchController: UISearchController, UISearchBarDelegate, UISearchResultsUpdating {

    var customDelegate: CustomSearchControllerDelegate!
    var customSearchBar: CustomSearchBar!
    
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect) {
        super.init(searchResultsController: searchResultsController)
        
        setupSearchBar(frame: searchBarFrame)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        customDelegate.customSearchBarTextDidBeginEditing(searchBar)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        customDelegate.customSearchBarTextDidEndEditing(searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        customDelegate.customSearchBarSearchButtonClicked(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        customDelegate.customSearchBarTextDidChange(searchBar, textDidChange: searchText)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //ADD TO PROTOCOL IF NEEDED
    }
    
    func closeKeyboard(){
        
        //customSearchBar.endEditing(true)
        //OR
        if customSearchBar.isFirstResponder{
            
            customSearchBar.resignFirstResponder()
        }
    }
    
    func openKeyboard(){
        
        customSearchBar.becomeFirstResponder()
    }
    
    func setupSearchBar(frame: CGRect) {
        
        customSearchBar = CustomSearchBar(frame: frame)
        customSearchBar.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
