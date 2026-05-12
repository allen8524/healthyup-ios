import UIKit
import WebKit

class WebViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음 들어왔을 때 기본으로 운동 정보 페이지 보여주기
        openWorkoutInfo()
    }

    // MARK: - Actions (버튼 3개)

    /// 네이버 운동 정보
    @IBAction func goWorkoutInfo(_ sender: UIButton) {
        openWorkoutInfo()
    }

    /// 홈트레이닝 유튜브 검색
    @IBAction func goHomeTraining(_ sender: UIButton) {
        openYoutubeSearch(query: "홈트레이닝 전신 운동 루틴")
    }

    /// 스트레칭 유튜브 검색
    @IBAction func goStretching(_ sender: UIButton) {
        openYoutubeSearch(query: "전신 스트레칭 루틴")
    }

    // MARK: - Private Methods

    /// 실제로 웹뷰에 URL을 로딩하는 함수
    private func load(_ url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

    /// 네이버에서 "헬스 운동 기본자세" 검색 결과 페이지 열기
    private func openWorkoutInfo() {
        var components = URLComponents(string: "https://m.search.naver.com/search.naver")
        components?.queryItems = [
            URLQueryItem(name: "query", value: "헬스 운동 기본자세")
        ]

        guard let url = components?.url else {
            print("❌ 네이버 운동 정보 URL 생성 실패")
            return
        }
        load(url)
    }

    /// 유튜브에서 특정 검색어로 검색
    private func openYoutubeSearch(query: String) {
        var components = URLComponents(string: "https://m.youtube.com/results")
        components?.queryItems = [
            URLQueryItem(name: "search_query", value: query)
        ]

        guard let url = components?.url else {
            print("❌ 유튜브 검색 URL 생성 실패")
            return
        }
        load(url)
    }
}
