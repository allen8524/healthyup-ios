# 기능 정리

## 프로젝트 기능 요약

HealthyUp iOS는 BMI 계산 결과를 확인한 뒤 운동 관련 정보를 탐색하고, 운동 영상을 확인하며, 간단한 운동 계획을 설정하는 흐름으로 구성한 iOS 앱입니다.

주요 화면은 Tab Bar Controller 기반으로 나뉘며, 각 화면은 UIKit과 Storyboard를 중심으로 구현했습니다.

## BMI 계산 기능

- `UITextField`를 사용해 키와 체중을 입력받습니다.
- 입력값이 비어 있거나 숫자로 변환할 수 없는 경우 안내 문구를 표시합니다.
- cm 단위로 입력된 키를 사용해 BMI를 계산합니다.
- `UISegmentedControl`의 성별 선택값에 따라 정상 BMI 범위를 다르게 적용합니다.
  남성은 20.0~25.0, 여성은 18.0~23.0을 학습용 예시 기준으로 사용합니다.
- 계산 결과에 따라 상태 문구, 라벨 배경색, 이미지 테두리 색상을 다르게 표시합니다.

## 운동 정보 탐색 기능

- `WKWebView`를 사용해 앱 내부에서 운동 관련 외부 검색 결과를 표시합니다.
- `URLComponents`와 `URLQueryItem`을 사용해 검색어가 포함된 URL을 생성합니다.
- 네이버에서 `헬스 운동 기본자세` 검색 결과를 기본 화면으로 로드합니다.
- 유튜브에서 `홈트레이닝 전신 운동 루틴`, `전신 스트레칭 루틴` 검색 결과를 버튼으로 열 수 있습니다.
- 앱이 자체 운동 데이터베이스를 갖는 구조가 아니라, 외부 검색 결과를 앱 내부에서 탐색하는 구조입니다.

## 운동 영상 재생 기능

- `AVKit`을 사용해 로컬 운동 영상을 재생합니다.
- `AVPlayerViewController`로 영상 플레이어 화면을 표시합니다.
- 앱 Bundle 내부에 포함된 `bench.mp4`, `squat.mp4`, `deadlift.mp4`를 찾아 재생합니다.
- 영상 파일을 찾을 수 없는 경우 `UIAlertController`로 확인 안내를 표시합니다.
- `bmi.mp4`는 Xcode 프로젝트 Resources에 포함되어 있지만, 현재 영상 재생 화면의 버튼에는 연결되어 있지 않은 보조/시연 리소스입니다.

## 운동 계획 설정 기능

- `UISegmentedControl`로 운동 강도를 선택합니다.
- 운동 강도는 `가볍게`, `보통`, `강하게` 세 단계로 표시합니다.
- `UISlider`로 운동 시간을 10분부터 120분까지 조정합니다.
- `UIStepper`로 세트 수를 1세트부터 10세트까지 조정합니다.
- `UILabel`로 현재 선택값과 운동 계획 요약 문구를 표시합니다.
- 선택값이 변경될 때마다 운동 계획 요약 문구를 갱신합니다.

## 앱 아이콘과 Launch Screen

- `Assets.xcassets`에 앱 아이콘 리소스를 구성했습니다.
- `LaunchScreen.storyboard`를 통해 앱 실행 시 표시되는 시작 화면을 적용했습니다.

## 사용한 iOS 기본 구성 요소

| 구성 요소 | 사용 위치 |
| --- | --- |
| `UITabBarController` | 주요 기능 화면 전환 |
| `UIViewController` | 각 기능 화면 구성 |
| `UITextField` | 키와 체중 입력 |
| `UILabel` | BMI 결과, 안내 문구, 운동 계획 요약 표시 |
| `UISegmentedControl` | 성별 선택, 운동 강도 선택 |
| `UISlider` | 운동 시간 설정 |
| `UIStepper` | 세트 수 설정 |
| `UIImageView` | BMI 화면 이미지와 결과 피드백 표시 |
| `WKWebView` | 운동 관련 외부 검색 결과 표시 |
| `AVPlayerViewController` | 로컬 mp4 운동 영상 재생 |
| `UIAlertController` | 영상 파일 누락 안내 |
