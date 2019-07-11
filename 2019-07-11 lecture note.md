# 2019-07-11 강의 노트(JAVA)
database lecture note

* JDK -> Java Development Kit
* JRE(Java Runtiem Environment) 자바실행 환경
* JVM(Java Virtual Machine) - JRE가 만들어 줌.

* netbin 많이 사용(외국), 한국은 eclipse
* JAVA 기본문법
   * Github/java

* JAVA EE 버튼 - perspective

* source file -> compiler(한꺼번에 검토, 실행), Interpreter(행단위 번역 및 실행)
> JAVA는 compiler 방식

* source file -> object  code + library ->(Linker가 실행) executabale code [예전방식]

* Integrated Development Envrionment(통합개발환경)
   * compile, link, execute

## JAVA Project(javabasic 프로젝트 이름)
   * package -> class
> class의 이름은 **반드시** 영문 대문자로 시작! -> A01_HelloW, A2_HelloW

* New project -> src 밑에 제목 오른쪽 버튼 클릭-> New -> Javaproject
-> class -> 제목 설정, public static void main(String[] args) 선택 -> finish

* //: 한줄 주석처리
* crtl + D : 삭제
* /* */: 여러 줄 주석처리
* /** */: document 주석, 문서화 작업 시 사용

* JAVA를 사용한다는 것은 class를 만든다는 것
* System: class 중 하나
* println: 함수 중 하나

* Build Automatically: 따로 compiling 할 필요 없이 명령구문 입력하고 실행하기만 하면 됨.

* 간단한 메시지 출력
````
package ch0;
public class A01_HelloWorld {
	public static void main(String[] args) {
		//간단한 메시지 출력
		System.out.println("안녕하세요");
	}
}
// output: "안녕하세요"
````






