iOS 프로젝트에서 사용할 수 있는 Shared Library를 빌드하는 Makefile입니다.

## 사용법

### 디렉토리 구조
* src : 소스파일이 위치합니다.
* build : 컴파일 결과물(*.o)이 저장되는 디렉토리입니다.
* out : 최종 결과물인 Shared Library(*.a)가 저장되는 디렉토리입니다.

### Makefile 용도에 맞게 변경

* PROJ : Shared Library의 파일명을 입력합니다.
* ARCH : CPU 아키텍처 종류를 입력합니다.(armv7, arm64, x86_64)
* SRCEXT, SOURCES, OBJECTS : 컴파일될 소스파일과 목적파일의 목록입니다.
* SRCEXT2, SOURCES2, OBJECTS2 : cpp이외의 확장자를 갖는 소스파일이 있을 경우 사용합니다.

### 사용법

```
$ make
$ make clean
```

## 추가할 내용
* 의존성 있는 라이브러리를 링크하는 과정 추가

## 참고 자료

* https://gist.github.com/j0sh/895945
* http://10apps.tistory.com/123
* http://stackoverflow.com/questions/27016612/compiling-external-c-library-for-use-with-ios-project
* https://gist.github.com/c0ming/10976661
* http://stackoverflow.com/questions/3520977/build-fat-static-library-device-simulator-using-xcode-and-sdk-4
