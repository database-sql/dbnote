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

### A01_Variable
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
* ������(��/��) ���ڷ� �����Ѵ�.
* class�� �̸��� �ݵ�� �빮�ڷ� ����, Ư�� ���ڴ� '_', '$' ��.
* �������� �Ϲ������� �ҹ��ڷ� �Է�, ������ ��� ������ �ǹ̸� �� ǥ���� �ִ� ���� ����.
   * camel ǥ�� ���
      * ex) levelOf Floor

* '=' : ���Կ�����, �Ҵ� ������(Assignment operator)
* �߰�ȣ{} �ڿ� �ּ�ǥ�� (coding �⺻����)
   * ex) // end of main()


* ���� ���� ����� ���� ����
````
// ���� ���� ����� ���� ����
char chval = 'A'; // ���� ������ ���� ����ǥ�� ���Ѵ�.
System.out.println(chval);
````

### A02_Character
* ������ Ÿ��
   * �⺻ �ڷ���, ���� �ڷ���
   * �⺻�ڷ����� ������, ������, �Ǽ���, ����
      * **������** : byte(1byte), short(2byte), int(4byte), long(8byte)
      * **������** : char(1byte)
      * **�Ǽ���** : float(4byte), double(4byte)
      * **����** : boolean

> Ctrl + Shift + / : ���� �� �ּ� ó��.

> Ctrl + Shift + \: ���� �� �ּ� ó�� ����.

> Ctrl + / : �� �� �ּ� ó��.

> Ctrl + / : �� �� �ּ� ó�� ����.

> sysout �Է� ��,  Ctrl + space bar : System.out.prinln()

* bit(binary digit) : 0, 1
* byte : 256��, byte type
   * 1 byte �� ǥ���� �� �ִ� ���� ���� - 0~255 (byte�� ��ȿ���� ������ -2^7 ~ 2^7-1)
> byte�� ���� ǥ�� (�ּ�)
````
package chapter2;

public class A02_Character {

	public static void main(String[] args) {
		byte b_num1 = -128;
		System.out.println(b_num1);
	}

}
````
> byte�� ���� ǥ�� (�ִ�)
````
byte b_num1 = 127;
````
* 2byte : short type(��ȿ���� ������ -2^15 ~ 2^15-1)
> short�� ��ȿ���� ǥ��
````
short s_num2 = -32767;
System.out.println(s_num2);
````
* 4byte : int type (��ȿ���� ������ -2^31 ~ 2^31-1, -2,147,483,648 ~ 2,147,483,647)
````		
int i_num3 = -2147483648;
System.out.println(i_num3);
````
* 8byte : long type (��ȿ���� ���� -2^63 ~ 2^63-1)

> �����Ϸ��� �о߿� ���� �ش� type�� �����ؼ� ���

* Min, Max�� �̿��� �ּ�, �ִ� �� ǥ��
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
		
System.out.println("short���� int���� ȥ�տ���" + sval + ival);
System.out.println(ival + fval);

// output: short���� int���� ȥ�տ���11
// output: 2.0
````
> ���� �ٸ� data type�� ȥ�� ������ �� ���� ����� ������ ū ������ ��ȯ�Ǿ� ó���ȴ�.





























