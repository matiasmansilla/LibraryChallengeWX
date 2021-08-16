//
//  BookListViewController.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 16/08/2021.
//

import UIKit

class BookListViewController: UIViewController {
    // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Constants and Localizables
  let constant: LibraryChallengeWXConstant = LibraryChallengeWXConstant()
  let localizables: LibraryChallengeWXLocalizables = LibraryChallengeWXLocalizables()
  
  // MARK: - Properties
  var presenter: BookListPresenterProtocol?
  var bookList: [BookViewModel] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  // MARK: - Initializer
  static func instantiate() -> BookListViewController {
    let storyboard = UIStoryboard(name: "BookListViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "BookListViewController") as? BookListViewController {
      return viewController
    } else {
      return BookListViewController()
    }
  }
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    showLoadingOverlay()
    presenter?.getBooks()
    setupTableView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupUI()
  }
  
  private func setupTableView() {
    tableView?.register(UINib(nibName: "BookCell", bundle: .main), forCellReuseIdentifier: "cell")
    tableView?.delegate = self
    tableView?.dataSource = self
  }
  
  private func setupUI() {
    self.view.backgroundColor = constant.bgMainScreenColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    self.title = "Library"
    
    let leftBarButton = UIButton()
    leftBarButton.setImage(#imageLiteral(resourceName: "ic_notifications"), for: .normal)
    leftBarButton.addTarget(self, action: #selector(leftBarButtonAction), for: .touchUpInside)
    
    let rightBarButton = UIButton()
    rightBarButton.setImage(#imageLiteral(resourceName: "ic_search"), for: .normal)
    rightBarButton.addTarget(self, action: #selector(rightBarButtonAction), for: .touchUpInside)
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
  }
  
  @objc private func rightBarButtonAction() {

  }
  @objc private func leftBarButtonAction() {
  }
}

extension BookListViewController: BookListViewProtocol {
  
  func loadBooks(from list: [BookViewModel]) {
    hideLoadingOverlay()
    bookList = list
  }
}

  // MARK: - TableView Datasource and Delegate
extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BookCell {
      
      cell.loadExperience(with: bookList[indexPath.row])
        return cell
    } else {
        return UITableViewCell()
    }

  }
  
  
}
