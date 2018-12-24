//
//  CharacterListViewController.swift
//  CharacterViewerFramework
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    private struct K {
        static let characterCollectionViewRowCell = "CharacterCollectionViewRowCell"
        static let characterCollectionViewItemCell = "CharacterCollectionViewItemCell"
    }
    
    // MARK:- IBOutlets
    @IBOutlet weak var characterListTable: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.color = UIColor.black
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
        }
    }
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = Constant.DefaultStrings.searchPlaceHolder
        }
    }
    
    // MARK:- Properties
    let itemInset: CGFloat = 8
    let zero: CGFloat = 8
    let itemHeightWhenList: CGFloat = 40
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    var cellsPerRow = 1
    var enabled = true
    var characterListViewModel: CharacterListViewModel = CharacterListViewModel()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpCollectionView()
        setUpData()
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    // MARK:- Private methods
    
    private func setUpCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: zero, left: itemInset, bottom: zero, right: itemInset)
        characterListTable.collectionViewLayout = layout
    }
    
    private func registerNib() {
        characterListTable.register(UINib(nibName: K.characterCollectionViewRowCell, bundle: CharacterViewerBundleHelper.bundle), forCellWithReuseIdentifier: K.characterCollectionViewRowCell)
        characterListTable.register(UINib(nibName: K.characterCollectionViewItemCell, bundle: CharacterViewerBundleHelper.bundle), forCellWithReuseIdentifier: K.characterCollectionViewItemCell)
    }
    
    private func setUpData() {
        title = characterListViewModel.titleString
        characterListViewModel.getData { (_, error) in
            if let error = error {
                self.showErrorAlert(title: Constant.DefaultStrings.error, message: error.localizedDescription, alertActions: nil)
            } else {
                DispatchQueue.main.async {
                    self.characterListTable.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    // MARK:- IBAction
    
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

// MARK:- UICollectionViewDataSource
extension CharacterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterListViewModel.relatedTopics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if enabled {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.characterCollectionViewRowCell, for: indexPath) as? CharacterCollectionViewRowCell else {
                return UICollectionViewCell()
            }
            cell.setUp(with: characterListViewModel.relatedTopics[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.characterCollectionViewItemCell, for: indexPath) as? CharacterCollectionViewItemCell else {
                return UICollectionViewCell()
            }
            cell.setUp(with: characterListViewModel.relatedTopics[indexPath.row])
            return cell
        }
    }
    
}

// MARK:- UICollectionViewDelegate
extension CharacterListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: Constant.StoryboardName.characterDetail, bundle: CharacterViewerBundleHelper.bundle)
        if let controller = storyboard.instantiateViewController(withIdentifier: Constant.StoryboardID.characterDetailViewController) as? CharacterDetailViewController {
            controller.characterDetailViewModel = CharacterDetailViewModel(topic: characterListViewModel.relatedTopics[indexPath.row])
            splitViewController?.showDetailViewController(controller, sender: nil)
        }
    }
    
}

// MARK:- UICollectionViewDelegateFlowLayout
extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginsAndInsets = CGFloat(itemInset * 2) + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        if enabled {
            return CGSize(width: itemWidth, height: itemHeightWhenList)
        } else {
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
}

// MARK:- UISplitViewControllerDelegate
extension CharacterListViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

// MARK:- UISearchBarDelegate
extension CharacterListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        characterListViewModel.filterCharacterList(searchText: searchText) {
            self.characterListTable.reloadData()
        }
    }
    
}
