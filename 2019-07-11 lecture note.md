# 2019-07-11 ���� ��Ʈ(JAVA)
database lecture note

* JDK -> Java Development Kit
* JRE(Java Runtiem Environment) �ڹٽ��� ȯ��
* JVM(Java Virtual Machine) - JRE�� ����� ��.

* netbin ���� ���(�ܱ�), �ѱ��� eclipse
* JAVA �⺻����
   * Github/java

* JAVA EE ��ư - perspective

* source file -> compiler(�Ѳ����� ����, ����), Interpreter(����� ���� �� ����)
> JAVA�� compiler ���

* source file -> object  code + library ->(Linker�� ����) executabale code [�������]

* Integrated Development Envrionment(���հ���ȯ��)
   * compile, link, execute

## JAVA Project(javabasic ������Ʈ �̸�)
   * package -> class
> class�� �̸��� **�ݵ��** ���� �빮�ڷ� ����! -> A01_HelloW, A2_HelloW

* New project -> src �ؿ� ���� ������ ��ư Ŭ��-> New -> Javaproject
-> class -> ���� ����, public static void main(String[] args) ���� -> finish

* //: ���� �ּ�ó��
* crtl + D : ����
* /* */: ���� �� �ּ�ó��
* /** */: document �ּ�, ����ȭ �۾� �� ���

* JAVA�� ����Ѵٴ� ���� class�� ����ٴ� ��(class ���)
* System: class �� �ϳ�
* println: �Լ� �� �ϳ�

* Build Automatically: ���� compiling �� �ʿ� ���� ��ɱ��� �Է��ϰ� �����ϱ⸸ �ϸ� ��.

* ������ �޽��� ���
````
package ch0;
public class A01_HelloWorld {
	public static void main(String[] args) {
		//������ �޽��� ���
		System.out.println("�ȳ��ϼ���");
	}
}
// output: "�ȳ��ϼ���"
````

* class �� �ҽ��� ���� ���
   * F3Ű 
> Ctrl + F : ã��

* ����
````
package chapter2;
public class A01_Variable1 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level; // ������ ���� level ����
		level = 10; // level ������ �� 10�� ����
		System.out.println(level);  // level �� ���
	}
}
````

* ����
````
package chapter2;
public class A01_Variable1 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level = 10; // ������ ���� level ����
		// level = 10; // level ������ �� 10�� ����
		System.out.println(level);  // level �� ���
	}
}
````
* code ���� : Ctrl + F11
* data type
   * char - ����
   * int, long - ����
   * double, float - �Ǽ�

* Ÿ��, ������(����� X, ex) public, class ��); 
* class�� �̸��� �ݵ�� �빮�ڷ� ����, Ư�� ���ڴ� '_', '$' ��.
* �������� �Ϲ������� �ҹ��ڷ� �Է�, ������ ��� ������ �ǹ̸� �� ǥ���� �ִ� ���� ����.
   * camel ǥ�� ���
      * ex) levelOf Floor

* '=' : ���Կ�����, �Ҵ� ������(Assignment operator)
* �߰�ȣ{} �ڿ� �ּ�ǥ�� (coding �⺻����)
   * ex) // end of main()

* ���� ���� ����� ���� ����
````
package chapter2;

public class A01_Variable1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int level; // ������ ���� level ����
		level = 10; // level ������ �� 10�� ����
		System.out.println(level);  // level �� ���
		
		**// ���� ���� ����� ���� ����**
		char chval = 'A'; // ���� ������ ���� ����ǥ�� ���Ѵ�.
		System.out.println(chval);
	}// end of main()
}// end of class()
````






















