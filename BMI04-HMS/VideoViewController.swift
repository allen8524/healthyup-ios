import UIKit
import AVKit

class VideoViewController: UIViewController {
    private enum VideoResource {
        static let bench = (name: "bench", title: "벤치프레스")
        static let squat = (name: "squat", title: "스쿼트")
        static let deadlift = (name: "deadlift", title: "데드리프트")
    }
    
    // MARK: - IBActions
    
    @IBAction func tapBenchPress(_ sender: UIButton) {
        playVideo(named: VideoResource.bench.name, title: VideoResource.bench.title)
    }
    
    @IBAction func tapSquat(_ sender: UIButton) {
        playVideo(named: VideoResource.squat.name, title: VideoResource.squat.title)
    }
    
    @IBAction func tapDeadlift(_ sender: UIButton) {
        playVideo(named: VideoResource.deadlift.name, title: VideoResource.deadlift.title)
    }
    
    // MARK: - Playback
    
    private func playVideo(named name: String, title: String) {
        // Bundle 내부 mp4 파일을 AVPlayerViewController로 재생합니다.
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp4") else {
            showAlert(message: "\(title) 영상 파일을 찾을 수 없습니다.\n파일 이름과 Target Membership 설정을 확인하세요.")
            return
        }
        
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.title = title
        
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // MARK: - Alert
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "재생 오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
