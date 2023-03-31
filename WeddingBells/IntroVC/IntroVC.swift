//
//  IntroVC.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 03/10/22.
//

import UIKit
import FSPagerView

class IntroVC: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource  {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var pageController: FSPageControl!
    
    var introTitle = ["intro1_title".localized(),"intro2_title".localized(),"intro3_title".localized()]
    var intoImage = ["ic_intro1","ic_intro2","ic_intro3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Do any additional setup after loading the view.
        
        self.pagerView.delegate = self
        self.pagerView.dataSource = self
        self.pagerView.automaticSlidingInterval = 6.0
        self.pagerView.interitemSpacing = 10
        self.pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        
        
        //MARK: - PageController Initialize
        
        self.pageController.numberOfPages = 3
        self.pageController.currentPage = 0
        self.pageController.interitemSpacing = 20
        self.pageController.contentHorizontalAlignment = .center
        self.pageController.setImage(UIImage.init(named: "ic_unselecetdpage"), for: .normal)
        self.pageController.setImage(UIImage.init(named: "ic_selecetdpage"), for: .selected)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    //MARK: - update Language
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.btnSkip.setTitle("skip".localized(), for: .normal)
        self.btnNext.setTitle("next".localized(), for: .normal)
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
        self.navigateToLogin()
    }
    
    @IBAction func btnNextAction(_ sender: UIButton) {
        let nextIndex = pagerView.currentIndex + 1 < numberOfItems(in:self.pagerView) ? pagerView.currentIndex + 1 : 0
        self.pagerView.scrollToItem(at: nextIndex, animated: true)
        
        if pagerView.currentIndex == 2 {
            self.navigateToLogin()
        }
    }
    
    //MARK: - FSPagerView Delegate and Datasource
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.introTitle.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: intoImage[index])
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        self.lblTitle.text = self.introTitle[pagerView.currentIndex]
    }
    
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.lblTitle.text = self.introTitle[pagerView.currentIndex]
        self.pageController.currentPage = pagerView.currentIndex
        if pagerView.currentIndex == 2 {
            self.btnSkip.isHidden = true
            self.btnNext.setTitle("login".localized(), for: .normal)
        }else {
            self.btnSkip.isHidden = false
            self.btnNext.setTitle("next".localized(), for: .normal)
        }
        
    }
    
    func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        self.lblTitle.text = self.introTitle[pagerView.currentIndex]
        self.pageController.currentPage = pagerView.currentIndex
        if pagerView.currentIndex == 2 {
            self.btnSkip.isHidden = true
            self.btnNext.setTitle("login".localized(), for: .normal)
        }else {
            self.btnSkip.isHidden = false
            self.btnNext.setTitle("next".localized(), for: .normal)
        }
    }

}
