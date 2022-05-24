
import UIKit

public class RCSRPasswordViewController: UIViewController {
    
    public var completion: RCSRPasswordCompletion?
    
    private lazy var container: UIView = {
        let instance = UIView()
        instance.backgroundColor = UIColor.white
        instance.layer.cornerRadius = 12
        instance.clipsToBounds = true
        return instance
    }()
    private lazy var titleLabel: UILabel = {
        let instance = UILabel()
        instance.font = .systemFont(ofSize: 15, weight: .medium)
        instance.textColor = UIColor(hexString: "#020037")
        instance.text = "设置4位数字密码"
        return instance
    }()
    fileprivate lazy var textField: UITextField = {
        let instance = UITextField()
        instance.backgroundColor = UIColor.white.withAlphaComponent(0.16)
        instance.textColor = .white
        instance.font = .systemFont(ofSize: 13)
        instance.delegate = self
        instance.layer.cornerRadius = 2
        instance.clipsToBounds = true
        instance.isHidden = true
        instance.returnKeyType = .done
        instance.keyboardType = .numberPad
        instance.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        return instance
    }()
    private lazy var cancelButton: UIButton = {
        let instance = UIButton()
        instance.backgroundColor = .clear
        instance.titleLabel?.font = .systemFont(ofSize: 17)
        instance.setTitle("取消", for: .normal)
        instance.setTitleColor(UIColor(hexString: "#020037"), for: .normal)
        instance.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return instance
    }()
    fileprivate lazy var uploadButton: UIButton = {
        let instance = UIButton()
        instance.isEnabled = false
        instance.backgroundColor = .clear
        instance.titleLabel?.font = .systemFont(ofSize: 17)
        instance.setTitle("提交", for: .normal)
        instance.setTitleColor(RCSCAsset.Colors.hexEF499A.color, for: .normal)
        instance.addTarget(self, action: #selector(handleInputPassword), for: .touchUpInside)
        return instance
    }()
    private lazy var passwordViews: [RCSRPasswordNumberView] = {
        var list = [RCSRPasswordNumberView]()
        for i in 0...3 {
            list.append(RCSRPasswordNumberView())
        }
        return list
    }()
    private lazy var sepLine1: UIView = {
        let instance = UIView()
        instance.backgroundColor = UIColor(hexString: "#E5E6E7")
        return instance
    }()
    private lazy var sepLine2: UIView = {
        let instance = UIView()
        instance.backgroundColor = UIColor(hexString: "#E5E6E7")
        return instance
    }()
    private lazy var stackView: UIStackView = {
        let instance = UIStackView(arrangedSubviews: passwordViews)
        instance.spacing = 21.resize
        instance.distribution = .equalSpacing
        return instance
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @objc
    private func handleTextChanged() {
        guard let text = textField.text else { return }
        for (index, item) in text.enumerated() {
            passwordViews[index].update(text: String(item))
        }
        for index in text.count..<4 {
            passwordViews[index].update()
        }
        uploadButton.isEnabled = text.count == 4
    }
    
    private func buildLayout() {
        view.backgroundColor = UIColor(hexInt: 0x03062F).withAlphaComponent(0.4)
        view.addSubview(container)
        
        container.addSubview(titleLabel)
        container.addSubview(textField)
        container.addSubview(cancelButton)
        container.addSubview(uploadButton)
        container.addSubview(sepLine1)
        container.addSubview(sepLine2)
        container.addSubview(stackView)
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200.resize)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(40.resize)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25.resize)
            $0.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20.resize)
            $0.left.right.equalToSuperview().inset(27.resize)
            $0.height.equalTo(36)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(textField)
        }
        
        sepLine1.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(29.resize)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        
        sepLine2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sepLine1.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(sepLine1.snp.bottom)
            make.right.equalTo(sepLine2.snp.left)
            make.height.equalTo(44)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.top.equalTo(sepLine1.snp.bottom)
            make.left.equalTo(sepLine2.snp.right)
        }
    }
    
    @objc
    private func handleInputPassword() {
        guard let text = textField.text else { return }
        dismiss(animated: true) { [weak self] in
            self?.completion?(text)
        }
    }
    
    @objc
    private func handleCancel() {
        dismiss(animated: true)
    }
}

extension RCSRPasswordViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" { textField.resignFirstResponder() }
        guard let text = textField.text, let range = Range(range, in: text) else {
            return false
        }
        return text.count - text[range].count + string.count <= 4
    }
}
