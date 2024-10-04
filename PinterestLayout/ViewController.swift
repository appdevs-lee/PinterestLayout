//
//  ViewController.swift
//  PinterestLayout
//
//  Created by Awesomepia on 10/4/24.
//

import UIKit

struct Gallery {
    let width: Double
    let height: Double
}

final class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 169, height: 211)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.headerReferenceSize = .zero
        flowLayout.footerReferenceSize = .zero
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let pinterestLayout = PinterestLayout()
        pinterestLayout.delegate = self
        collectionView.collectionViewLayout = pinterestLayout
        
        return collectionView
    }()
    
    var imageList: [Gallery] = [
        Gallery(width: 200, height: 300),
        Gallery(width: 400, height: 200),
        Gallery(width: 300, height: 300),
        Gallery(width: 150, height: 200),
        Gallery(width: 200, height: 150),
        Gallery(width: 200, height: 300),
        Gallery(width: 400, height: 200),
        Gallery(width: 300, height: 300),
        Gallery(width: 150, height: 200),
        Gallery(width: 200, height: 150),
        Gallery(width: 200, height: 300),
        Gallery(width: 400, height: 200),
        Gallery(width: 300, height: 300),
        Gallery(width: 150, height: 200),
        Gallery(width: 200, height: 150),
        Gallery(width: 200, height: 300),
        Gallery(width: 400, height: 200),
        Gallery(width: 300, height: 300),
        Gallery(width: 150, height: 200),
        Gallery(width: 200, height: 150),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setDelegates()
        self.setGestures()
        self.setNotificationCenters()
        self.setSubviews()
        self.setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    deinit {
        print("----------------------------------- ViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension ViewController: EssentialViewMethods {
    func setViewFoundation() {
        
    }
    
    func initializeObjects() {
        
    }
    
    func setDelegates() {
        
    }
    
    func setGestures() {
        
    }
    
    func setNotificationCenters() {
        
    }
    
    func setSubviews() {
        self.view.addSubview(self.collectionView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // collectionView
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func setViewAfterTransition() {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        //self.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Extension for methods added
extension ViewController {
    
}

// MARK: - Extension for selector methods
extension ViewController {
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let gallery = self.imageList[indexPath.row]
        
        cell.setCell(name: "Splash")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let cellWidth: CGFloat = (view.bounds.width - 4) / 2 // 셀 가로 크기
        let imageHeight = imageList[indexPath.row].height
        let imageWidth = imageList[indexPath.row].width
        // 이미지 비율
        let imageRatio = imageHeight/imageWidth


        return imageRatio * cellWidth
    }
}
