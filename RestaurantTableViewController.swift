//
//  DesignerTableViewController.swift
//  iBuildApp
//
//  Created by WUQINGHUA on 30/01/2017.
//  Copyright © 2017 Ava Wu. All rights reserved.
//

import UIKit
import Alamofire

struct post {
    let mainImage : UIImage!
    let name : String!
}

class RestaurantTableViewController: UITableViewController {

    var posts = [post]()

    /*//Get the url from this website👉https://developer.spotify.com
    // 👉 Tools 👉Web API 👉API Console 👉Search for an Item
     */
    var searchURL = "https://api.spotify.com/v1/search?q=restaurants&type=track"
    

    typealias JSONStandard = [String : AnyObject]

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        callAlamo(url: searchURL)

    }

    //Call the alamofire to load the data
    func callAlamo(url : String){
        Alamofire.request(url).responseJSON(completionHandler: {

            response in
            self.parseData(JSONData: response.data!)

        })
    }

    //Pass and use the data.
    func parseData(JSONData : Data){


        do{
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard

            if let tracks = readableJSON["tracks"] as? JSONStandard{

                if let items = tracks["items"] as? [JSONStandard] {

                    for i in 0..<items.count{

                        let item = items[i]
                        print(item)

                        let name = item ["name"] as! String

                        if let album = item["album"] as? JSONStandard{

                            if let images = album["images"] as? [JSONStandard]{

                            let imageData = images[0]
                                let mainImageURL = URL(string: imageData["url"] as! String)
                                let mainImageData = NSData(contentsOf: mainImageURL!)

                                let mainImage = UIImage(data: mainImageData as! Data)

                                posts.append(post.init(mainImage: mainImage, name: name))

                                self.tableView.reloadData()
                            }

                        }

                    }

                }

            }

        }
        catch {
            print(error)
        }


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return posts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DesignerCell")

        // Configure the cell...

        let mainImageView = cell?.viewWithTag(2) as! UIImageView

        mainImageView.image = posts[indexPath.row].mainImage

        let mainLabel = cell?.viewWithTag(1) as! UILabel

        mainLabel.text = posts[indexPath.row].name

        return cell!
    }


    //Method for translate data in the tableView row to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let indexPath = self.tableView.indexPathForSelectedRow?.row

        let detail = segue.destination as! RestaurantDetail

        detail.image = posts[indexPath!].mainImage
        detail.mainRestaurantName = posts[indexPath!].name

    }

}
