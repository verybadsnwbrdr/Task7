import UIKit

final class ViewController: UIViewController {
	private let imageView = UIImageView()
	private let scrollView = UIScrollView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewDidLayoutSubviews()
		scrollView.frame.origin.y = -view.safeAreaInsets.top
	}
	
	private func setup() {
		view.backgroundColor = .white
		view.addSubview(scrollView)
		
		scrollView.delegate = self
		scrollView.frame = view.bounds
		scrollView.contentSize.height = 1200
		
		imageView.image = UIImage(named: "picture")
		imageView.contentMode = .scaleAspectFill
		
		scrollView.addSubview(imageView)
	}
}

extension ViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let contentOffset = scrollView.contentOffset.y
		guard contentOffset <= 0 else {
			return
		}
		imageView.frame = CGRect(
			x: .zero,
			y: contentOffset,
			width: scrollView.bounds.width,
			height: 270 - contentOffset
		)
		scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - view.safeAreaInsets.top
	}
}
