//
//  NYListingViewController.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import UIKit



protocol ProtocolNYLsitingView {
    
    func updateView(with model:NYMostPopularLsitingModel)
    func updateView(with error:String)
}

class NYListingViewController: UIViewController , ProtocolNYLsitingView {
   
   
    var interactor : ProtocolListingInteractor?
    var router : NYListingRouter?
    
    
    @IBOutlet var tableView: UITableView!
    var model : NYMostPopularLsitingModel?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        NYListingConfigurator.sharedInstance.setup(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fetchListing()
        // Do any additional setup after loading the view.
    }
    
    func fetchListing()
    {
        HUD.sharedInstance.showHud()
        interactor?.callNYTimeMostPopularApi()
    }
    

    
    func updateView(with model: NYMostPopularLsitingModel) {
        
        HUD.sharedInstance.hideHud()
        self.model = model
        self.tableView.reloadData()
    }
    
    
    func updateView(with error: String) {
        
        HUD.sharedInstance.hideHud()
        presentAlert(withTitle: "Error", message: error)
    }
    
   

}


extension NYListingViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.model?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NYListingTableViewCell

        if let object = model?.results[indexPath.row]
        {
            
            cell?.updateData(object: object)
        }

        
        
        return cell ?? UITableViewCell()
    }
}


extension NYListingViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let object = model?.results[indexPath.row]
        {
            router?.navigateToDetailScreen(viewController: self, with: object)
        }
    }
}
