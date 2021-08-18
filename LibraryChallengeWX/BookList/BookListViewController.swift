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
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchBarStackView: UIStackView!
  @IBOutlet weak var searchButton: UIStackView!
  
  // MARK: - Constants and Localizables
  let constant: LibraryChallengeWXConstant = LibraryChallengeWXConstant()
  let localizables: LibraryChallengeWXLocalizables = LibraryChallengeWXLocalizables()
  
  // MARK: - Properties
  var presenter: BookListPresenterProtocol?
  
  var bookList: [BookViewModel] = []
  var filteredBookList: [BookViewModel] = []
  
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
    setupNavBar()
  }
  
  private func setupNavBar() {
    let image = UIImage(named: "bc_nav bar")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    self.navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.tintColor = .white
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  private func setupTableView() {
    tableView?.register(UINib(nibName: "BookCell", bundle: .main), forCellReuseIdentifier: "cell")
    tableView?.delegate = self
    tableView?.dataSource = self
  }
  
  private func setupUI() {
    searchBarStackView.isHidden = true
    searchButton.alpha = 0
    searchBarStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    searchBarStackView.isLayoutMarginsRelativeArrangement = true
    searchBar.sizeToFit()
    searchBar.returnKeyType = .search
    
    self.view.backgroundColor = constant.bgMainScreenColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
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
    UIView.animate(withDuration: 0.3) {
      self.searchBarStackView.isHidden.toggle()
      self.searchButton.alpha = self.searchButton.isHidden ? 0 : 1
    }
  }
  @objc private func leftBarButtonAction() {
  }
  
  @IBAction func searchButtonAction(_ sender: Any) {
      showLoadingOverlay()
      presenter?.getBooks()
  }
  
  private func search() {
    filteredBookList = []
    if let text = searchBar.text, !text.isEmpty {
      guard let searchedText = searchBar.text else { return }
      for book in bookList {
        guard let titlebook = book.book?.title else { return }
        if titlebook.lowercased().contains(searchedText.lowercased()) {
          filteredBookList.append(book)
        }
      }
    } else {
      //when empy search text
      filteredBookList = bookList
    }
    self.tableView.reloadData()
  }
}

extension BookListViewController: BookListViewProtocol {
  
  func loadBooks(from list: [BookViewModel]) {
    hideLoadingOverlay()
    bookList = list
    filteredBookList = list
    search()
    tableView.reloadData()
  }
}

// MARK: - TableView Datasource and Delegate
extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredBookList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BookCell {
      
      cell.loadExperience(with: filteredBookList[indexPath.row])
      return cell
    } else {
      return UITableViewCell()
    }
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    BookDetailsRouter().navigateToBookDetails(from: self)
  }
  
}
