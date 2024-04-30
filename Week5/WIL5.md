2주간의 시험기간이 끝나고 나서 첫 과제여서 그런지 이번 과제는 구현 과제가 아니라 정리 과제였다.

오늘 정리해볼 내용은 크게 2가지다.

1. State에 대하여

2. 상태관리 툴들에 대하여

---

1. 먼저 State에 관하여 정리해보자
   Flutter에서 State란 앱에서 사용되는 data를 의미한다.
   조금더 명확하게 공식문서의 내용을 정리하자면 아래와 같이 나타낼 수 있다.

[1] 위젯이 빌드될 때 동기적으로 읽을 수 있는 정보
[2] 위젯의 생명주기가 끝나기 전까지 변경될 수 있는 정보

이런 State를 Flutter에선 **App state**와 **Widget state** 이렇게 2개로 구분한다.

- **App state**는 플러터 앱 전반에 걸쳐 사용되는 data로, 여러 위젯이나 스크린에서 쓰이는 것들을 의미한다.
  앱의 이곳 저곳에서 필요하고 한쪽에서 변경할 경우 다른 쪽에서도 그 변경점이 반영이 될 필요가 있다.
  (다른 프로그래밍 언어에서 전역변수와 비슷한 뉘앙스인 거 같다)

- **Widget state**는 이와 반대로 Ephemeral state, local state라고도 불리며 특정한 위젯 내부에서만 사용되는 data이다.
  위젯 내부에서만 사용이 되니 외부와 굳이 공유하거나 반환할 필요가 없다.
  (다른 프로그래밍 언어에서 지역변수와 비슷한 뉘앙스인 거 같다)

이 두가지를 쉽고 명확하게 구분이 가능하다면 편하겠지만 그것은 불가능하기에 사전에 **약속**을 하는 방법이 가장 용이하다.

여기서 사용되는 개념이 **StatelessWideget**과 **StatefulWidget**이다.

**StatefulWidget**은 이름 그대로 state가 존재하는 Widget이다.
그래서 내부에서 data가 변경될 경우, 그에 상응하는 화면을 다시 출력하여 변경된 부분을 위젯에 반영할 수 있다.
예를들어 👍버튼을 누르면 그에 의해 숫자가 변경되는 버튼이 있다고 가정할 때, 그 숫자를 계속해서 반영해주어야 한다.

**StateleeWidget**은 이름 그대로 state가 없는 Widget이다. 그렇다고 하여 data가 없느냐? 그것은 아니다.
*변경할 data가 없다!*라고 이해하면 간단할 거 같다.

화면 한 부분에 설명을 담당하는 Text위젯이나, 배경이 되는 위젯 등을 비롯한 클릭을 하여도 어떠한 반응을 하지도 않는 녀석들을 **StateleeWidget**이라고 한다.

![StatelessWidget](/Week5/images/StatelessWidget.png)

그러나 **StateleeWidget**도 바꿀 수 있다. 바꾸기 위해선 조건이 필요하다.
바로 _StatelessWidget의 상위 위젯에 Stateful위젯이 있어야하고,_<br/>
_Stateful위젯에서 StatelessWidget을 build할 때, 넣는 인자값이 바뀌고, 그리고 Stateful위젯에서setstate이 실행_ 되어야 한다.

![StatefullWidget](/Week5/images/StatefulWidget.png)

---

2. 다음은 상태관리 툴들에 대하여 알아보자. 공식문서에 나오는 툴만 해도 약 16개 정도가 나온다.
   그러나 이걸 다 보기엔 너무 머리 아프니 가장 많이 중요히 다루는 `Provider`, `Riverpod`, `GetX`, `Bloc`에 관하여 정리해보겠다.

그 전에 우리가 왜 상태관리 툴을 사용해야하는지에 관하여 알아보자.
![3-UI](/Week5/images/aaa.png)
위의 그림과 같은 UI가 있다고 가정해보자. 이때 만약 3번째 UI에서 서로 공유하고 있는 Argument에 변경이 발생한 경우,<br/>
이를 공유하고 있는 UI는 리빌드 되어야 해당 데이터의 변경을 적용할 수 있다.<br/>
이를 해결하기 위해서 상태관리라는 개념이 태어난 것이다.

이제부터 그 상태관리 툴들을 순서대로 알아보자

- `Provider`
  `Provider`는 pub.dev 라이브러리에 2018년 10월에 등록이 되었다.

  ![Provider](/Week5/images/Provider.png)

  위와 같은 상태가 있다고 생각해보자. 만약 G위젯이 J위젯과 동일한 state(Data)가 필요하다면 어떻게 해결할 수 있을까?
  간단히 생각하면 왼쪽 위젯을 E, C, A, 오른쪽 위젯은 H를 거친후 결과적으로 Root Widget에서 만나서 파라메터로 해당 상태를 전달하면 된다.
  그러나 이렇게 되면 필요없는 너무 많은 위젯들을 리빌딩해야하므로 성능이슈가 발생할 가능성이 높아진다.

  이럴 때 등장한 것이 `Provider`이다.

  `Provider`를 사용할 때는 위젯의 트리와 상관없이 state(Data)를 저장할 클래스를 생성하고,<br/>
  해당 상태를 공유하는 공통의 부모 위젯에 `Provider`를 제공(Provide)하고,<br/>
  상태를 사용하는 곳에서 `Provider`의 데이터를 읽어서 사용하게 된다.

  다만 `Provider`는 `Riverpod`라는 단점을 개선한 버전이 등장했기에 추후에 사용되지 않을 가능성이 존재한다.

- `Riverpod`
  `Riverpod`는 `Provider`의 단점을 개선한 라이브러리이다.
  Flutter에 의존하지 않기에 Flutter가 없이 Dart만으로도 사용이 가능하다는 장점이 존재한다.
  또한 컴파일하는 동안에 안전하나는 장점 또한 존재한다.

* `GetX`
  `GetX`는 state Manager들 중 인기가 가장 많은 것 중 하나이다.
  `GetX`는 성능향상을 위해 최소한의 리소스만을 소비하도록 만들어진 라이브러리이다.
  많은 사람들이 다른 state Manager들을 사용하는 것보다 간편하고 간단하게 상태관리를 진행할 수 있다고 말한다.
  `GetX`는 크게 **Simple 방식**, **Reactive 방식** 이렇게 2개로 구분지을 수 있다.
  **Simple 방식**의 경우, `Provider` 사용방법과 거의 유사하다.

  **Reactive 방식**의 경우, **Simple 방식**보다 훨씬 많은 기능이 있다.

  - State가 업데이트 되어도 해당 값이 실제로 바뀌지 않는다면 리빌딩을 하지 않는다.
  - State값의 변화에 따라 `ever`, `once`, `double`, `interval`등 _Workers_ 를 등록해서 사용할 수 있다.

  결론적으로 **Simple 방식**은 사용 메모리가 적고, **Reactive 방식**은 state값 변화에 따라 부가적인 기능을 제공한다.
  따라서 프로젝트 규모나 상황에 따라 적절한 방식으로 선택하면 된다.

- `Bloc`
  `Bloc`는 _Business Login Componetes_ 의 약자이다.
  `Bloc`은 크게 데이터영역, 화면 영역, 그리고 `Bloc`영역으로 구성된다.
  state는 결국 Data(변화하는)이기에 데이터 영역에서 다룰 수 있다.
  여기서 다뤄진 정보들은 화면 영역으로 전달되는데,<br/>
  이 사이에 `Bloc`가 있기 때문에 결국 `Bloc`가 이 상태를 받아와서 화면에 전달하거나, 상태의 변화를 발생시키는 역할을 맡게 된다.

  채팅앱등에서 **Stream**이라는 컨셉으로 `Bloc`패턴을 사용할 경우 실시간으로 state의 변화를 감지하여 화면 영역으로 정보를 전달할 수 있게 된다.

이렇게 오늘은 State에 대한 개념과 StatelessWidget, StatefullWidget에 대하여 공부하였고,<br/>
이로인해 발생하는 상태문제를 해결하기 위해 사용되는 state Manager에 대하여 공부해보았다.

참고문헌<br/>
[NOGUEN 블로그](https://noguen.tistory.com/24)<br/>
[Flutter-공식문서](https://docs.flutter.dev/data-and-backend/state-mgmt/options#triple-pattern-segmented-state-pattern)<br/>
[깡샘의 토마토](https://kkangsnote.tistory.com/247)<br/>
[DeKu](https://deku.posstree.com/ko/flutter/provider/)<br/>
[플러터 Riverpod로 상태관리 하기](https://medium.com/uplusdevu/%ED%94%8C%EB%9F%AC%ED%84%B0-riverpod%EB%A1%9C-%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC-%ED%95%98%EA%B8%B0-cd164f0644e5)<br/>
[stone1098.log](https://velog.io/@stone1098/%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC-Bloc)<br/>
[dosilv.log](https://velog.io/@dosilv/Flutter-GetX%EB%A1%9C-%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC)<br/>
[나요의 튜토리얼](https://nayotutorial.tistory.com/88)
