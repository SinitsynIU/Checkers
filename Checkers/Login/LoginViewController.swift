
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageViewPlayer: UIImageView!
    @IBOutlet weak var lableHello: UILabel!
    @IBOutlet weak var imageViewCheckers: UIImageView!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAction()
        userDefaultsRemove()
        scrollView.delegate = self
        textFieldName.delegate = self
    }
    
    func setupUI() {
        self.overrideUserInterfaceStyle = .light
        textFieldName.layer.cornerRadius = 25
        textFieldName.layer.borderWidth = 1
        textFieldName.layer.borderColor = UIColor.black.cgColor
        buttonDone.layer.cornerRadius = 15
        imageViewPlayer.layer.cornerRadius = 75
        buttonDone.isEnabled = false
    }
    
    func setupAction () {
        textFieldName.addTarget(self, action: #selector(textFieldNameChangeAction), for: .editingChanged)
    }
    
    @objc func textFieldNameChangeAction () {
        if (textFieldName.text?.count ?? 0) > 0 {
            buttonDone.isEnabled = true
        } else {
            buttonDone.isEnabled = false
        }
    }
    
    func userDefaultsRemove() {
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "avatarImageView")
        UserDefaults.standard.removeObject(forKey: "bgColorView")
        UserDefaults.standard.removeObject(forKey: "secondUserName")
    }
    
    
    @IBAction func buttonDoneAction(_ sender: Any) {
        guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.set(textFieldName?.text ?? "", forKey: "userName")
            if let dataImageAv = self.image?.jpegData(compressionQuality: 0.96) {
                UserDefaults.standard.set(dataImageAv, forKey: "avatarImageView")
            }
    }
    
    @IBAction func buttonImageChangeAction(_ sender: Any) {
        let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.allowsEditing = true
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
    }
}

extension LoginViewController: UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let onePageOffSet = scrollView.contentSize.width / CGFloat(pageControl.numberOfPages)
        pageControl.currentPage = Int(scrollView.contentOffset.x / onePageOffSet)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePlayer = info[.editedImage] as? UIImage {
            self.image = imagePlayer
            self.imageViewPlayer.image = imagePlayer
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
