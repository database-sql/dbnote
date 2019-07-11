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

### A01_Variable
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
* 영문자(대/소) 숫자로 구성한다.
* class의 이름은 반드시 대문자로 시작, 특수 문자는 '_', '$' 만.
* 변수형은 일반적으로 소문자로 입력, 무엇을 담는 것인지 의미를 다 표현해 주는 것이 좋음.
   * camel 표기 방법
      * ex) levelOf Floor

* '=' : 대입연산자, 할당 연산자(Assignment operator)
* 중괄호{} 뒤에 주석표시 (coding 기본습관)
   * ex) // end of main()


* 문자 변수 선언과 값의 대입
````
// 문자 변수 선언과 값의 대입
char chval = 'A'; // 문자 변수는 작은 따옴표로 감싼다.
System.out.println(chval);
````

### A02_Character
* 데이터 타입
   * 기본 자료형, 참조 자료형
   * 기본자료형은 정수형, 문자형, 실수형, 논리형
      * **정수형** : byte(1byte), short(2byte), int(4byte), long(8byte)
      * **문자형** : char(1byte)
      * **실수형** : float(4byte), double(4byte)
      * **논리형** : boolean

> Ctrl + Shift + / : 여러 줄 주석 처리.

> Ctrl + Shift + \: 여러 줄 주석 처리 해제.

> Ctrl + / : 한 줄 주석 처리.

> Ctrl + / : 한 줄 주석 처리 해제.

> sysout 입력 후,  Ctrl + space bar : System.out.prinln()

* bit(binary digit) : 0, 1
* byte : 256개, byte type
   * 1 byte 로 표현할 수 있는 숫자 범위 - 0~255 (byte의 유효숫자 범위는 -2^7 ~ 2^7-1)
> byte로 숫자 표현 (최소)
````
package chapter2;

public class A02_Character {

	public static void main(String[] args) {
		byte b_num1 = -128;
		System.out.println(b_num1);
	}

}
````
> byte로 숫자 표현 (최대)
````
byte b_num1 = 127;
````
* 2byte : short type(유효숫자 범위는 -2^15 ~ 2^15-1)
> short의 유효숫자 표시
````
short s_num2 = -32767;
System.out.println(s_num2);
````
* 4byte : int type (유효숫자 범위는 -2^31 ~ 2^31-1, -2,147,483,648 ~ 2,147,483,647)
````		
int i_num3 = -2147483648;
System.out.println(i_num3);
````
* 8byte : long type (유효숫자 범위 -2^63 ~ 2^63-1)

> 응용하려는 분야에 따라서 해당 type를 선택해서 사용

* Min, Max를 이용한 최소, 최대 값 표시
> short
````
System.out.println(Short.MIN_VALUE);
		System.out.println(Short.MAX_VALUE);
````

> int
````
System.out.println(Integer.MIN_VALUE);
		System.out.println(Integer.MAX_VALUE);
````

* 
````
short sval = 1;
int ival = 1;
double fval = 1.0;
		
System.out.println("short형과 int형의 혼합연산" + sval + ival);
System.out.println(ival + fval);

// output: short형과 int형의 혼합연산11
// output: 2.0
````
> 서로 다른 data type을 혼합 연산할 때 연산 결과는 범위가 큰 쪽으로 변환되어 처리된다.





























