//
//  CountriesTableViewController.swift
//  TP2_Groupe_3
//
//  Created by Andy Randrianirina on 20/03/2021.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return countriesByContinent.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i = 0
        var result = 0
        for (value) in countriesByContinent.values{
            if section == i{
                result = value.count
                break
            }
            i = i+1
        };
        
        return result
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Creating a table cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
             
        //Preparing cell data
        
        
        var i = 0
        var result : [Country] = [Country]()
        for (value) in countriesByContinent.values{
            if indexPath.section == i{
                result = value
                break
            }
            i = i+1
        };
        
        let country = result[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.isoCode
        
        //Updating image size
        let targetSize = CGSize(width: 33, height: 25)
        let currentImage = UIImage(named: country.isoCode)
        
        cell.imageView?.image = resizedImage(image: currentImage, size:targetSize)
        
        //Returning the cell
        return cell
    }
    
    func resizedImage(image: UIImage?, size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image?.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var i = 0
        var result = ""
        for current in countriesByContinent.keys{
            if section == i{
                result = current
                break
            }
            i = i+1
        };
        return result
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
