import UIKit
import UserNotifications

final class ScreenForSaveViewController: UIViewController {
    // MARK: - Constants
    private let backgroundShadow = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
    // MARK: - Outlets
    @IBOutlet weak private var enterInfoLabel: UILabel!
    @IBOutlet weak private var nameField: UITextField!
    @IBOutlet weak private var surnameField: UITextField!
    @IBOutlet weak private var datePicker: UIDatePicker!
    @IBOutlet weak private var timePicker: UIDatePicker!
    @IBOutlet weak private var saveButton: UIButton!
    
    // MARK: - Actions
    @IBAction private func saveButtonAction(_ sender: Any) {
        let saveName = nameField.text!
        let saveSurname = surnameField.text!
        let selectedDate = datePicker.date
        let selectedTime = timePicker.date
        
        if (saveName.isEmpty) || (saveSurname.isEmpty) {
            alertEmptyField(title: "Attention", message: "Please, fill all fields")
        } else {
            let user = User(name: saveName, surname: saveSurname, dateOfBirth: selectedDate, timeOfNotification: selectedTime)
            UserManager.instance.saveUserToUserDefaults(user: user)
            NotificationManager.instance.createNotification(user: user)
            alertSucceededSaving(title: "Saving succeeded", message: "")
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationController()
        setupFields()
        setupSaveButton()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = backgroundShadow
    }
    
    private func setupNavigationController() {
        title = "New Info"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupFields() {
        nameField.roundedTextField()
        surnameField.roundedTextField()
    }
    
    private func setupSaveButton() {
        saveButton.roundedButton()
        saveButton.backgroundColor = .white
    }
    
    // MARK: - Helpers
    private func alertEmptyField(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func alertSucceededSaving(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Touche responders
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
