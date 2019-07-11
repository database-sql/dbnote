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

* JAVA를 사용한다는 것은 class를 만든다는 것(class 기반)
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

* class 의 소스를 보는 방법
   * F3키 
> Ctrl + F : 찾기

* 예제
````
package chapter2;
public class A01_Variable1 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level; // 정수형 변수 level 선언
		level = 10; // level 변수에 값 10을 대입
		System.out.println(level);  // level 값 출력
	}
}
````

* 예제
````
package chapter2;
public class A01_Variable1 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level = 10; // 정수형 변수 level 선언
		// level = 10; // level 변수에 값 10을 대입
		System.out.println(level);  // level 값 출력
	}
}
````
* code 실행 : Ctrl + F11
* data type
   * char - 문자
   * int, long - 정수
   * double, float - 실수

* 타입, 변수명(예약어 X, ex) public, class 등); 
* class의 이름은 반드시 대문자로 시작, 특수 문자는 '_', '$' 만.
* 변수형은 일반적으로 소문자로 입력, 무엇을 담는 것인지 의미를 다 표현해 주는 것이 좋음.
   * camel 표기 방법
      * ex) levelOf Floor

* '=' : 대입연산자, 할당 연산자(Assignment operator)
* 중괄호{} 뒤에 주석표시 (coding 기본습관)
   * ex) // end of main()

* 문자 변수 선언과 값의 대입
````
package chapter2;

public class A01_Variable1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level; // 정수형 변수 level 선언
		level = 10; // level 변수에 값 10을 대입
		System.out.println(level);  // level 값 출력
		
		**// 문자 변수 선언과 값의 대입**
		char chval = 'A'; // 문자 변수는 작은 따옴표로 감싼다.
		System.out.println(chval);
	}// end of main()
}// end of class()
````






















