// Dart의 비동기 프로그래밍을 위한 'dart:async' 라이브러리 임포트
import 'dart:async';

// 애플리케이션의 진입점인 main 함수를 정의
void main() {
  // PomodoroTimer 클래스의 인스턴스 생성
  PomodoroTimer pomodoroTimer = PomodoroTimer();
  // 생성된 인스턴스의 start 메서드를 호출하여 타이머 시작
  pomodoroTimer.start();
}

// PomodoroTimer 클래스를 정의
// 이 클래스는 포모도로 타이머의 주요 기능을 담당.
class PomodoroTimer {
  // 세션 카운트를 관리하는 변수. 작업 세션의 수를 추적.
  int sessionCount = 0;
  // 작업 시간을 분 단위로 설정하는 변수. 기본값은 25분.
  int workMinutes = 25;
  // 짧은 휴식 시간을 분 단위로 설정하는 변수. 기본값은 5분.
  int shortBreakMinutes = 5;
  // 긴 휴식 시간을 분 단위로 설정하는 변수. 기본값은 15분.
  int longBreakMinutes = 15;
  // 타이머의 남은 시간을 초 단위로 관리하는 변수. 초기값은 25분으로 설정.
  int remainingTime = 25 * 60;

  // 타이머 시작 메서드.
  void start() {
    // 콘솔에 메시지를 출력하며 타이머 시작.
    print("flutter: pomodoro 타이머를 시작합니다.");
    // 첫 번째 작업 세션을 시작하는 메서드 호출.
    startSession();
  }

  // 작업 세션을 시작하는 메서드.
  void startSession() {
    // 세션 카운트를 1 증가.
    sessionCount++;
    // 남은 시간을 작업 시간으로 초기화. 분을 초로 변환하여 할당한다.
    remainingTime = workMinutes * 60;
    // 카운트다운 타이머를 시작하는 메서드 호출.
    countdownTimer();
  }

  // 휴식 시간을 시작하는 메서드.
  void startBreak(bool isLongBreak) {
    // 남은 시간을 긴 휴식 또는 짧은 휴식 시간으로 설정. 분 -> 초로 변환하여 할당.
    remainingTime =
        isLongBreak ? longBreakMinutes * 60 : shortBreakMinutes * 60;
    // 휴식의 종류를 문자열 변수에 할당.
    String breakType = isLongBreak ? "긴 휴식" : "휴식";
    // 콘솔에 휴식 시작을 알리는 메시지를 출력.
    print(
        "$breakType이 ${isLongBreak ? longBreakMinutes : shortBreakMinutes}분간 진행됩니다..");
    // 카운트다운 타이머를 시작하는 메서드 호출. 휴식 여부와 긴 휴식 여부를 인자로 전달.
    countdownTimer(isBreak: true, isLongBreak: isLongBreak);
  }

  // 카운트다운 타이머를 관리하는 메서드, 휴식 여부와 긴 휴식 여부를 선택적 인자로 받는다.
  void countdownTimer({bool isBreak = false, bool isLongBreak = false}) {
    // 1초마다 반복 실행되는 타이머를 생성.
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      // 남은 시간이 0 이하일 경우 타이머를 중단.
      if (remainingTime <= 0) {
        timer.cancel(); // 타이머를 취소.
        if (isBreak) {
          // 현재 휴식 시간이라면,
          if (sessionCount < 4) {
            // 세션 카운트가 4보다 작으면 작업 세션을 다시 시작.
            startSession();
          } else {
            // 세션 카운트가 4 이상이면 모든 작업이 끝났음을 알림.
            print("작업이 모두 끝났습니다. 수고하셨습니다.");
          }
        } else {
          // 현재 작업 시간이면 휴식 시간을 시작.
          print("작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.");
          startBreak(sessionCount == 4); // 세션 카운트가 4이면 긴 휴식, 아니면 짧은 휴식을 시작.
        }
      } else {
        // 남은 시간을 분과 초로 나누어 콘솔에 출력.
        int minutes = remainingTime ~/ 60;
        int seconds = remainingTime % 60;
        print(
            "flutter: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}");
        remainingTime--; // 남은 시간을 1초 감소.
      }
    });
  }
}
