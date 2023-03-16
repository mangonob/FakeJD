//
//  PageView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/17.
//

import SwiftUI

struct PageView<Page>: UIViewControllerRepresentable where Page: View {
    @Binding var currentIndex: Int
    var pages: [Page]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        pageViewController.view.backgroundColor = .clear
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentIndex]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var pageView: PageView
        var controllers: [UIViewController]
        
        init(_ pageView: PageView<Page>) {
            self.pageView = pageView
            self.controllers = pageView.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if (index > 0) {
                return controllers[index - 1]
            } else {
                return controllers.last
            }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if (index < controllers.count - 1) {
                return controllers[index + 1]
            } else {
                return controllers.first
            }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                pageView.currentIndex = index
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    @State static var currentIndex = 0
    
    static var previews: some View {
        return VStack {
            PageView(currentIndex: $currentIndex, pages: [
                PageViewExample(text: "A"),
                PageViewExample(text: "B", color: .green),
                PageViewExample(text: "C", color: .blue),
                PageViewExample(text: "D", color: .purple)
            ])
            .aspectRatio(1.5, contentMode: .fit)
        }
    }
}

struct PageViewExample: View {
    var text: String
    var color: Color = .red
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 42, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
        .ignoresSafeArea()
    }
}
