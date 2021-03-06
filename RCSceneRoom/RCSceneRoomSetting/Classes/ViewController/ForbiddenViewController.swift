//
//  ForbiddenViewController.swift
//  RCE
//
//  Created by shaoshuai on 2021/11/26.
//

import Foundation

enum ForbiddenCellType {
    case append
    case word(String)
}

public class ForbiddenViewController: UIViewController {
    
    private var list = [ForbiddenCellType]()
    private lazy var collectionView: UICollectionView = {
        let layout = RCSceneFlowLayout(horizontalAlignment: .left,
                                       verticalAlignment: .top)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = CGSize(width: 100, height: 30)
        let instance = UICollectionView(frame: .zero, collectionViewLayout: layout)
        instance.showsVerticalScrollIndicator = false
        instance.showsHorizontalScrollIndicator = false
        instance.register(cellType: ForbiddenWordCell.self)
        instance.register(cellType: ForbiddenAppendCell.self)
        instance.delegate = self
        instance.dataSource = self
        instance.backgroundColor = .clear
        return instance
    }()
    private lazy var containerView: UIView = {
        let instance = UIView()
        instance.backgroundColor = .clear
        return instance
    }()
    private lazy var titleLabel: UILabel = {
        let instance = UILabel()
        instance.font = .systemFont(ofSize: 17)
        instance.textColor = .white
        instance.text = "屏蔽词"
        return instance
    }()
    private lazy var effectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        return UIVisualEffectView(effect: blurEffect)
    }()
    private lazy var separatorLine: UIView = {
        let instance = UIView()
        instance.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        return instance
    }()
    private lazy var forbiddenTitleLabel: UILabel = {
        let instance = UILabel()
        instance.font = .systemFont(ofSize: 14)
        instance.textColor = .white
        instance.text = "设置屏蔽词 (0/10)"
        return instance
    }()
    private lazy var forbiddenDescLabel: UILabel = {
        let instance = UILabel()
        instance.font = .systemFont(ofSize: 12)
        instance.textColor = UIColor.white.withAlphaComponent(0.65)
        instance.text = "包含屏蔽词的发言将不会被其他用户看到"
        return instance
    }()
    
    private var items: [String]
    private weak var delegate: RCSceneRoomSettingProtocol?
    public init(_ items: [String], delegate: RCSceneRoomSettingProtocol) {
        self.items = items
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        reloadWords()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.roundCorners(corners: [.topLeft, .topRight], radius: 22)
    }
    
    private func buildLayout() {
        enableClickingDismiss()
        view.addSubview(containerView)
        containerView.addSubview(effectView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(separatorLine)
        containerView.addSubview(forbiddenTitleLabel)
        containerView.addSubview(forbiddenDescLabel)
        containerView.addSubview(collectionView)
        
        containerView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        effectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        forbiddenTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(separatorLine.snp.bottom).offset(16)
        }
        
        forbiddenDescLabel.snp.makeConstraints { make in
            make.left.equalTo(forbiddenTitleLabel)
            make.top.equalTo(forbiddenTitleLabel.snp.bottom).offset(4)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(forbiddenDescLabel.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func showAppendAlert() {
        let alert = UIAlertController(title: "添加屏蔽词", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.addTarget(self,
                                action: #selector(self.handleTextFieldEditing(_:)),
                                for: .editingChanged)
        }
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { [weak alert] _ in
            guard let text = alert?.textFields?.first?.text, !text.isEmpty else {
                return self.alert("屏蔽词不能为空")
            }
            self.appendForbidden(name: text)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showDeleteAlert(word: String) {
        let alert = UIAlertController(title: "是否删除屏蔽词", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
            self.deleteForbidden(name: word)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func handleTextFieldEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        guard textField.markedTextRange == nil else {
            return
        }
        textField.text = String(text.prefix(11))
    }
}

extension ForbiddenViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = list[indexPath.row]
        switch item {
        case .append:
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ForbiddenAppendCell.self)
            return cell
        case .word:
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ForbiddenWordCell.self)
            cell.updateCell(item: list[indexPath.row])
            return cell
        }
    }
}

extension ForbiddenViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = list[indexPath.row]
        switch item {
        case .append:
            guard list.count < 11 else {
                return self.alert("最多只能添加10个屏蔽词")
            }
            showAppendAlert()
        case let .word(word):
            showDeleteAlert(word: word)
        }
    }
}

extension ForbiddenViewController {
    func reloadWords() {
        list = [.append] + items.map { ForbiddenCellType.word($0) }
        forbiddenTitleLabel.text = "设置屏蔽词 (\(items.count)/10)"
        collectionView.reloadData()
    }
    
    func appendForbidden(name: String) {
        if items.count >= 10 { return }
        items.append(name)
        reloadWords()
        delegate?.eventDidTrigger(.forbidden(items), extra: nil)
    }
    
    func deleteForbidden(name: String) {
        if let index = items.firstIndex(of: name) {
            items.remove(at: index)
        }
        reloadWords()
        delegate?.eventDidTrigger(.forbidden(items), extra: nil)
    }
}

extension ForbiddenViewController {
    func alert(_ msg: String) {
        let controller = UIAlertController(title: "提示", message: msg, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "确定", style: .default))
        present(controller, animated: true)
    }
}
