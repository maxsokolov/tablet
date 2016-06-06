//
//  MainController.swift
//  TabletDemo
//
//  Created by Max Sokolov on 16/04/16.
//  Copyright © 2016 Tablet. All rights reserved.
//

import UIKit
import Tablet










class MainController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: tableView)
        }
    }
    var tableDirector: TableDirector!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let h = PrototypeHeightStrategy(tableView: tableView)
        h.height("123", cell: StoryboardImageTableViewCell.self)
        
        let rowBuilder = TableRowBuilder<String, StoryboardImageTableViewCell>(items: ["1", "1", "1", "1"])
            .action(.click) { [unowned self] e in
                self.performSegueWithIdentifier("headerfooter", sender: nil)
            }
        
        let rows2 = TableRowBuilder<String, StoryboardImageTableViewCell>(items: ["1", "1", "1", "1"])
        
        
        
        
        let cellItem = RowItem<String, StoryboardImageTableViewCell>(item: "1")
        
        let cellItem2 = RowItem<String, StoryboardImageTableViewCell>(item: "1")
        
        let cellItem3 = RowItem<String, StoryboardImageTableViewCell>(item: "1")
       
        
        
        
        let b = TableDynamicRowBuilder(items: [cellItem, cellItem2, cellItem3])


        
        
        rowBuilder
            .addAction(TableRowAction(type: .Click) { (data) in
            
                
            })
        
        rowBuilder
            .delete(indexes: [0], animated: .None)
            .insert(["2"], atIndex: 0, animated: .None)
            .update(index: 0, item: "", animated: .None)
            .move([1, 2], toIndexes: [3, 4])

        
        let section = TableSectionBuilder(headerTitle: "", footerTitle: "", rows: [rowBuilder])
        
        //tableView.moveRowAtIndexPath(<#T##indexPath: NSIndexPath##NSIndexPath#>, toIndexPath: <#T##NSIndexPath#>)
        //tableView.deleteRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        //tableView.insertRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        //tableView.reloadRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        
        //tableView.moveSection(0, toSection: 0)
        //tableView.reloadSections([], withRowAnimation: .None)
        //tableView.deleteSections([], withRowAnimation: .None)
        //tableView.insertSections([], withRowAnimation: .None)
        
        tableDirector.performBatchUpdates {
            
            
        }
        
        tableDirector.append(section: section)

        tableDirector += rowBuilder
        tableDirector += rows2
    }
}