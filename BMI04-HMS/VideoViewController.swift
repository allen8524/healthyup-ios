import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    // MARK: - IBActions (버튼 3개)
    
    @IBAction func tapBenchPress(_ sender: UIButton) {
        // 벤치프레스 영상 재생
        playVideo(named: "bench", title: "벤치프레스")
    }
    
    @IBAction func tapSquat(_ sender: UIButton) {
        // 스쿼트 영상 재생
        playVideo(named: "squat", title: "스쿼트")
    }
    
    @IBAction func tapDeadlift(_ sender: UIButton) {
        // 데드리프트 영상 재생
        playVideo(named: "deadlift", title: "데드리프트")
    }
    
    // MARK: - 공통 재생 함수
    
    private func playVideo(named name: String, title: String) {
        // 앱 번들에서 mp4 파일 찾기
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp4") else {
            showAlert(message: "\(title) 영상 파일을 찾을 수 없습니다.\n파일 이름과 Target Membership을 확인하세요.")
            return
        }
        
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.title = title
        
        // 전체 화면으로 표시
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // MARK: - 에러 얼럿
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "재생 오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배경색이나 제목을 바꾸고 싶으면 여기서 조정
        // self.view.backgroundColor = UIColor.systemPurple
    }
}
