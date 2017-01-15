//
//  TMMatchesVC.swift
//  TrulyMadlyDemo
//
//  Created by Abhishek Thapliyal on 1/14/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class TMMatchesVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var matchCollectionView: UICollectionView!
    
    var headerView : TMCollectionHeaderView? = nil
    let reusableIdentifier = "TMMatchesViewCell" as String
    var listArray = NSMutableArray()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.matchCollectionView.delegate = self
        self.matchCollectionView.dataSource = self
        
        listArray.add("one")
        listArray.add("two")
        listArray.add("three")
        listArray.add("four")
        listArray.add("five")
        listArray.add("six")
        
        self.matchCollectionView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    //====================================================================================================================================
    // UICollectionView DELEGATES
    //====================================================================================================================================

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let matchesViewCell : TMMatchesViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reusableIdentifier, for: indexPath) as! TMMatchesViewCell
        matchesViewCell.backgroundColor = UIColor.blue
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let matchesViewCell : TMMatchesViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reusableIdentifier, for: indexPath) as! TMMatchesViewCell
        
        matchesViewCell.UserImageView.image = UIImage(named: "")
        matchesViewCell.UserName.text = listArray.object(at: indexPath.row) as? String
        
        return matchesViewCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("COUNT : \(listArray.count)")
        return listArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if(kind == UICollectionElementKindSectionHeader) {
            
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                         withReuseIdentifier: "collectionHeaderView", for: indexPath) as! TMCollectionHeaderView
            
            
        }
        
        return headerView!;
    }
    
}
