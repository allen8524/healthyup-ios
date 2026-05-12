import UIKit
import WebKit

class WebViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 기본 운동 정보 검색 결과를 표시합니다.
        openWorkoutInfo()
    }

    // MARK: - Actions

    /// 운동 정보 검색 결과 페이지를 엽니다.
    @IBAction func goWorkoutInfo(_ sender: UIButton) {
        openWorkoutInfo()
    }

    /// 홈트레이닝 관련 영상을 검색합니다.
    @IBAction func goHomeTraining(_ sender: UIButton) {
        openYoutubeSearch(query: "홈트레이닝 전신 운동 루틴")
    }

    /// 스트레칭 관련 영상을 검색합니다.
    @IBAction func goStretching(_ sender: UIButton) {
        openYoutubeSearch(query: "전신 스트레칭 루틴")
    }

    // MARK: - Private Methods

    /// URL을 웹뷰에 로드합니다.
    private func load(_ url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

    /// URLComponents로 검색어를 안전하게 조합해 네이버 검색 결과를 엽니다.
    private func openWorkoutInfo() {
        var components = URLComponents(string: "https://m.search.naver.com/search.naver")
        components?.queryItems = [
            URLQueryItem(name: "query", value: "헬스 운동 기본자세")
        ]

        guard let url = components?.url else {
            print("네이버 운동 정보 URL 생성 실패")
            return
        }
        load(url)
    }

    /// URLComponents로 검색어를 안전하게 조합해 유튜브 검색 결과를 엽니다.
    private func openYoutubeSearch(query: String) {
        var components = URLComponents(string: "https://m.youtube.com/results")
        components?.queryItems = [
            URLQueryItem(name: "search_query", value: query)
        ]

        guard let url = components?.url else {
            print("유튜브 검색 URL 생성 실패")
            return
        }
        load(url)
    }
}
