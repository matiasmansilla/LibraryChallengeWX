//
//  LoginView.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
  // MARK: - Outlets
  @IBOutlet weak var welcomeLabel: UILabel!
  @IBOutlet weak var nameTextField: ValidableTextField!
  @IBOutlet weak var lastNameTextField: ValidableTextField!
  @IBOutlet weak var emailtextField: ValidableTextField!
  @IBOutlet weak var dateTextField: ValidableTextField!
  @IBOutlet weak var checkBoxButton: CheckBoxWX!
  @IBOutlet weak var loginButton: PrimaryButtonWX!
  @IBOutlet weak var agreeTermsLabel: UILabel!
  
  
  
  // MARK: - Properties
  var presenter: LoginPresenterProtocol?
  let user: User = User()
  var datePicker: UIDatePicker?
  var isAgreeTerms: Bool = false
  var isValidForm: Bool = false {
    didSet {
      loginButton.isEnabled = self.isValidForm ? true : false
    }
  }
  
  // MARK: - Constants and Localizables
  let constant: LibraryChallengeWXConstant = LibraryChallengeWXConstant()
  let localizables: LibraryChallengeWXLocalizables = LibraryChallengeWXLocalizables()
  
  // MARK: - Initializer
  static func instantiate() -> LoginViewController {
    let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
      return viewController
    } else {
      return LoginViewController()
    }
  }
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.delegate = self
    lastNameTextField.delegate = self
    emailtextField.delegate = self
    dateTextField.delegate = self
    
    checkBoxButton.handleAction = {
      self.isAgreeTerms.toggle()
      self.isValidForm = self.validateForm()
      
    }
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    self.view.addGestureRecognizer(tapGesture)
    
    
    
    
    
    
    //  TODO TEMP QUIT QUIT QUIT
    presenter?.navigateToBookList()
    
    
    
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupUI()
  }
  
  private func setupUI() {
    
    loginButton.isEnabled = false
    
    datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: dateTextField.frame.size.width, height: 200))
    datePicker?.datePickerMode = .date
    datePicker?.preferredDatePickerStyle = .wheels
    datePicker?.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
    dateTextField.inputView = datePicker
    let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
    let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
    toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
    dateTextField.inputAccessoryView = toolBar
    
    self.title = localizables.loginTitle
    
    view.backgroundColor = constant.bgMainScreenColor
    
    nameTextField.placeholder = localizables.loginNamePlaceholder
    lastNameTextField.placeholder = localizables.loginLastNamePlaceholder
    emailtextField.placeholder = localizables.loginEmailPlaceholder
    dateTextField.placeholder = localizables.loginBirthdatePlaceholder
  }
  
  private func validateForm() -> Bool {
    guard let nameText = nameTextField.text, !nameText.isEmpty else { return false }
    guard let lastNameText = lastNameTextField.text, !lastNameText.isEmpty else { return false }
    guard let emailText = emailtextField.text, !emailText.isEmpty else { return false }
    guard let dateText = dateTextField.text, !dateText.isEmpty else { return false }
    guard isAgreeTerms else { return false}
    return true
  }
  @IBAction func loginButtonAction(_ sender: Any) {
    
    var user: User = User()
    user.name = nameTextField.text
    user.lastname = lastNameTextField.text
    user.email = emailtextField.text
    
    let now: Date = Date()
    if let birthday: Date = datePicker?.date {
      let calendar: Calendar = Calendar.current
      let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
      user.age = ageComponents.year
    }
    showLoadingOverlay()
    presenter?.login(with: user)
  }
  
  @objc func datePickerDone() {
    dateTextField.resignFirstResponder()
  }
  
  @objc func dateChanged() {
    let dateFormatted = DateFormatter()
    dateFormatted.dateFormat = "MM/dd/yyyy"
    if let date = datePicker?.date {
      dateTextField.text = dateFormatted.string(from: date)
    }
  }
  
  @objc private func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIView.endEditing), to: nil, from: nil, for: nil)
  }
  
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldDidChangeSelection(_ textField: UITextField) {
    isValidForm = validateForm()
  }
}
