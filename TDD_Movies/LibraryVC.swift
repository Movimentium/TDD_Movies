//
//  LibraryVC.swift
//  TDD_Movies
//
//  Created by Miguel Gallego on 5/7/24.
//

import UIKit

class LibraryVC: UIViewController {

    @IBOutlet weak var tableVw: UITableView!
    private let movieLibraryDataService = MovieLibraryDataService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableVw.dataSource = movieLibraryDataService
        tableVw.delegate = movieLibraryDataService
        print(#function)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
