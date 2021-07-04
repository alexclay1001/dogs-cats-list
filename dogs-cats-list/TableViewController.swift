//
//  TableViewController.swift
//  dogs-cats-list
//
//  Created by Aleksandra Glinina on 04.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var cats = [CatModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TopTableViewCell", bundle: nil), forCellReuseIdentifier: TopTableViewCell.identifier)
        tableView.register(UINib(nibName: "MiddleTableViewCell", bundle: nil), forCellReuseIdentifier: MiddleTableViewCell.identifier)
        
        
        loadData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell") as! TopTableViewCell
            configureTopCell(cell: cell)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MiddleTableViewCell") as! MiddleTableViewCell
            configureMiddleCell(cell: cell)
            return cell
        }
    }
    
    private func configureTopCell(cell: TopTableViewCell) {
        cell.name.text = cats[0].name

        guard let url = URL(string: (cats[0].image?.url!)!) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode),
                  let resultImage = UIImage(data: data),
                  error == nil else { return }

            DispatchQueue.main.async {
                cell.catImage.image = resultImage
            }
        }
        dataTask.resume()
//        loadImage(urlString: (cats[0].image?.url)!) { resultImage in
//            cell.catImage.image = resultImage
//        }
    }
    
    private func configureMiddleCell(cell: MiddleTableViewCell) {
        cell.leftName.text = cats[1].name
        cell.rightName.text = cats[2].name

        guard let url = URL(string: (cats[1].image?.url!)!) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode),
                  let resultImage = UIImage(data: data),
                  error == nil else { return }

            DispatchQueue.main.async {
                cell.leftImage.image = resultImage
            }
        }
        dataTask.resume()
        
        guard let secondUrl = URL(string: (cats[2].image?.url!)!) else { return }
        var secondUrlRequest = URLRequest(url: secondUrl)
        secondUrlRequest.httpMethod = "GET"

        let secondDataTask = session.dataTask(with: secondUrlRequest) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode),
                  let resultImage = UIImage(data: data),
                  error == nil else { return }

            DispatchQueue.main.async {
                cell.rightImage.image = resultImage
            }
        }
        secondDataTask.resume()
//        loadImage(urlString: (cats[0].image?.url)!) { resultImage in
//            cell.catImage.image = resultImage
//        }
    }
    
    
    func loadData() {
        let decoder = JSONDecoder()
        let urlString = "https://api.thecatapi.com/v1/breeds"
        
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            do {
                guard let data = data,
                      let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode), error == nil else {
                    print("Error in request")
                    return
                }
                self.cats = try decoder.decode([CatModel].self, from: data)
                let catsPrefix = self.cats[..<6]
                self.cats = Array(catsPrefix)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
       
            } catch let error {
                print("Error while retreiving data from network. Error message: \(error)")
            }
        }
        dataTask.resume()
    }
    
//    func loadImage(urlString: String, onCompete: @escaping (UIImage?) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data,
//                  let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode),
//                  let resultImage = UIImage(data: data),
//                  error == nil else { return }
//
//            onCompete(resultImage)
//        }
//        dataTask.resume()
//    }
}
