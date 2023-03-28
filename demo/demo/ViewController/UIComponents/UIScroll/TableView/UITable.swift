//
//  UITableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/03/23.
//

import UIKit

class UITable: UITableViewController {


    static let avengers = ["The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame"]

    static let ironMan = ["Iron Man", "Iron Man 2", "Iron Man 3"]

    static let movies = [avengers, ironMan]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 120

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        headerView.backgroundColor = .opaqueSeparator

        let label = UILabel(frame: headerView.bounds)
        label.text = "Table View with custom header, footer and sections"
        label.textAlignment = .center
        headerView.addSubview(label)

        tableView.tableHeaderView = headerView

        tableView.sectionHeaderTopPadding = 5.0


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Self.movies.count
    }

    override func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return Self.movies[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoviesCell
            else {
            return UITableViewCell()
        }
        cell.movieName.text = Self.movies[indexPath.section][indexPath.row]
        cell.moviePoster.image = UIImage(named: Self.movies[indexPath.section][indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
            else {
            return
        }

        movieDetailsVC.name = Self.movies[indexPath.section][indexPath.row]
        movieDetailsVC.image = UIImage(named: Self.movies[indexPath.section][indexPath.row]) ?? UIImage()
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionHeader = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        let label = UILabel(frame: sectionHeader.bounds)
        label.text = "Movie series - \(section + 1)"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        sectionHeader.addSubview(label)

        return sectionHeader
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
