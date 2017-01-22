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
    
    //====================================================================================================================================
    // VIEW LIFE CYCLE
    //====================================================================================================================================
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.matchCollectionView.delegate = self
        self.matchCollectionView.dataSource = self
        
        let ob1 = TMMatches()
        ob1.displayName = "Alia Bhatt"
        ob1.userImage = UIImage(named: "alia.jpg")
        listArray.add(ob1)
        
        let ob2 = TMMatches()
        ob2.displayName = "Deepika Padukone"
        ob2.userImage = UIImage(named: "deepika.jpg")
        listArray.add(ob2)
        
        let ob3 = TMMatches()
        ob3.displayName = "Jacqueline Fernandez"
        ob3.userImage = UIImage(named: "jacqueline.jpg")
        listArray.add(ob3)
        
        let ob4 = TMMatches()
        ob4.displayName = "Kriti Sanon "
        ob4.userImage = UIImage(named: "kriti.jpg")
        listArray.add(ob4)
        
        self.matchCollectionView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        let matchOb =  listArray.object(at: indexPath.row) as! TMMatches
                
        matchesViewCell.UserImageView.image = matchOb.userImage
        matchesViewCell.UserName.text = matchOb.displayName as String?
        
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
                                                                         withReuseIdentifier: "collectionHeaderView", for: indexPath) as? TMCollectionHeaderView
            
            
        }
        
        return headerView!;
    }
    
}
