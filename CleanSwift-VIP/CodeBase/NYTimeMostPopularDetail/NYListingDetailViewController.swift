//
//  NYListingDetailViewController.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import UIKit

class NYListingDetailViewController: UIViewController {

    @IBOutlet var labelDetail: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelAuthor: UILabel!
    @IBOutlet var labelHeading: UILabel!
    
    var object : NYMostPopularResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelHeading.text = object?.title
        labelAuthor.text = object?.byline
        labelDate.text = object?.published_date
        labelDetail.text = object?.abstract
        // Do any additional setup after loading the view.
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
