//
//  RemainderDataSource.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

import UIKit
class RemainderDataSource: NSObject,UITableViewDataSource,UITableViewDelegate{
  
    private var remainderList = [Remainder]()
    private var isPreviousIndex:Bool!
    private var isToday:Bool!
    
    init(remainderList:[Remainder]) {
        self.remainderList = remainderList
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remainderList.count
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemainderCell.reuseIdentifier, for: indexPath) as! RemainderCell
        var item:Remainder!
        item = remainderList[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    func update(with remainderList: [Remainder]) {
        self.remainderList = remainderList
    }
}


