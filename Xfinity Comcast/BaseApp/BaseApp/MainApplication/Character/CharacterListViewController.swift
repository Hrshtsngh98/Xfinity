//
//  CharacterListViewController.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    @IBOutlet weak var characterListTable: UICollectionView!
    
    var relatedTopics: [RelatedTopics] = []
    let inset = 8
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    var cellsPerRow = 1
    var enabled = true
    
    private let characterCollectionViewRowCell = "CharacterCollectionViewRowCell"
    private let characterCollectionViewItemCell = "CharacterCollectionViewItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpCollectionView()
        setUpData()
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    func setUpCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        characterListTable.collectionViewLayout = layout
    }
    
    func registerNib() {
        characterListTable.register(UINib(nibName: characterCollectionViewRowCell, bundle: BaseAppBundleHelper.bundle), forCellWithReuseIdentifier: characterCollectionViewRowCell)
        characterListTable.register(UINib(nibName: characterCollectionViewItemCell, bundle: BaseAppBundleHelper.bundle), forCellWithReuseIdentifier: characterCollectionViewItemCell)
    }
    
    func setUpData() {
        let characterListViewModel = CharacterListViewModel()
        title = characterListViewModel.titleString
        characterListViewModel.characterFactory.getData { (model, error) in
            if let error = error {
                self.showErrorAlert(error: error, alertActions: nil)
            } else {
                self.relatedTopics = model!.relatedTopics!
                DispatchQueue.main.async {
                    self.characterListTable.reloadData()
                }
            }
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleLayoutAction() {
        enabled = !enabled
        if enabled {
            cellsPerRow = 1
        } else {
            cellsPerRow = 2
        }
        characterListTable.reloadData()
    }
    
}

extension CharacterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedTopics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if enabled {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCollectionViewRowCell, for: indexPath) as? CharacterCollectionViewRowCell else {
                return UICollectionViewCell()
            }
            cell.setUp(with: relatedTopics[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCollectionViewItemCell, for: indexPath) as? CharacterCollectionViewItemCell else {
                return UICollectionViewCell()
            }
            cell.setUp(with: relatedTopics[indexPath.row])
            return cell
        }
    }
    
}

extension CharacterListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "CharacterDetail", bundle: BaseAppBundleHelper.bundle)
        if let controller = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController {
            controller.relatedTopic = relatedTopics[indexPath.row]
            splitViewController?.showDetailViewController(controller, sender: nil)
        }
    }
    
}

extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginsAndInsets = CGFloat(inset * 2) + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        if enabled {
            return CGSize(width: itemWidth, height: itemWidth/2)
        } else {
            return CGSize(width: itemWidth, height: itemWidth*2)
        }
    }
    
}

extension CharacterListViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
