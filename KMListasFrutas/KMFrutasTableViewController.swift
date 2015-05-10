//
//  KMFrutasTableViewController.swift
//  KMListasFrutas
//
//  Created by Kaue Mendes on 3/26/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class KMFrutasTableViewController: UITableViewController, KMFFrutasViewControllerDelegate {

    var frutasArray : [[String:AnyObject]] =
        [ [ "isfavorited" : false   ,  "name" : "Abacaxi" ],
          [ "isfavorited" : false   ,  "name" : "Banana" ],
          [ "isfavorited" : false   ,  "name" : "Cereja" ],
          [ "isfavorited" : false   ,  "name" : "Kiwi" ],
          [ "isfavorited" : false   ,  "name" : "Laranja" ],
          [ "isfavorited" : false   ,  "name" : "Limao" ],
          [ "isfavorited" : false   ,  "name" : "Maca" ],
          [ "isfavorited" : false   ,  "name" : "Manga" ],
          [ "isfavorited" : false   ,  "name" : "Nectarina" ],
          [ "isfavorited" : false   ,  "name" : "Uva" ] ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        
        return frutasArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as KMFFrutasTableViewCell    
        
        let frutasAr   = frutasArray[indexPath.row]["name"] as? String
        let frutasHide = frutasArray[indexPath.row]["isfavorited"] as? Bool
 
        cell.txtNameFrutas.text  = frutasAr
        cell.imgFrutas.image     = UIImage(named: frutasAr!.lowercaseString )
        cell.starFavorite.hidden = !frutasHide!
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueViewFruta", sender: indexPath)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        var vc = segue.destinationViewController as KMFFrutasViewController
        vc.delegate = self
        
        
        let indexPath = sender as NSIndexPath
        
        let frutas = frutasArray[indexPath.row]
        
        let NomedaFruta = frutas["name"] as? String
        let IsFavorito = frutas["isfavorited"] as? Bool
        
        vc.isFavorited = IsFavorito!
        vc.nameFruta = NomedaFruta!
        vc.imgFruta =  NomedaFruta!.lowercaseString
        vc.indexFruta = indexPath.row
        
    }

    func frutaFavorito(fruta: Int, isfavorito: Bool) {
        
        frutasArray[fruta]["isfavorited"] = isfavorito
        self.tableView.reloadData()
    }
    
}
