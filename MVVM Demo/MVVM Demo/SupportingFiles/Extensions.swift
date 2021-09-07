//
//  Extensions.swift
//
//
//  Created by Shrikant Upadhayay on 31/08/21.
//  Copyright © 2021 Shrikant Upadhayay. All rights reserved.
//

import Foundation
import UIKit


extension UITableView{
    
    func registerCell(tableView:UITableView,cellIdentifier:String){
        tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}


extension UICollectionView{
    
    func registerCell(collectionView:UICollectionView,cellIdentifier:String){
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
}
