@isTest
public with sharing class HocSinhTriggerHandlerTest {
    @isTest
    static void onBeforeInsert() {
       Test.startTest();
       HocSinhTriggerHandler.onBeforeInsert(listStudent1);
       Test.stopTest();
   }
   @isTest
    static void onBeforeInsert1() {
       Test.startTest();
       HocSinhTriggerHandler.onBeforeInsert(listStudent2);
       Test.stopTest();
   }
   @isTest
    static void onBeforeInsert2() {
       Test.startTest();
       HocSinhTriggerHandler.onBeforeInsert(listStudent3);
       Test.stopTest();
   }
   @isTest
    static void onBeforeInsert3() {
       Test.startTest();
       HocSinhTriggerHandler.onBeforeInsert(listStudent4);
       Test.stopTest();
   }
   @isTest
   static void onBeforeInsert4() {
      Test.startTest();
      HocSinhTriggerHandler.onBeforeInsert(listStudent5);
      Test.stopTest();
  }
    private static List<Lop__c> listClass;
    private static List<HocSinh__c> listStudent1;
    private static List<HocSinh__c> listStudent2;
    private static List<HocSinh__c> listStudent3;
    private static List<HocSinh__c> listStudent4;
    private static List<HocSinh__c> listStudent5;
    static {
        listClass = new List<Lop__c>();
        listClass.add(createClass('Lop 1'));
        listClass.add(createClass('Lop 2'));
        listClass.add(createClass('Lop 3'));
        listClass.add(createClass('Lop 4'));
        insert listClass;

        listStudent1 = new List<HocSinh__c>();
        listStudent2 = new List<HocSinh__c>();
        listStudent3 = new List<HocSinh__c>();
        listStudent4 = new List<HocSinh__c>();
        listStudent5 = new List<HocSinh__c>();
        Date birthday = date.newInstance(2012,05,22);
        Date birthday2 = date.newInstance(2003,05,22);
        Date birthday1 = null;
        Integer point = null;
        listStudent1.add(createStudent('Trần ', 'Văn A', true, birthday1, 2, 2, 2, listClass[0].Id));
        listStudent2.add(createStudent('Trần ', 'Văn B', true, birthday, point, 5, 5, listClass[1].Id));
        listStudent3.add(createStudent('Trần ', 'Văn C', true, birthday, 7, point, 7, listClass[2].Id));
        listStudent4.add(createStudent('Trần ', 'Văn D', true, birthday, 9, 9, point, listClass[3].Id));
        listStudent5.add(createStudent('Trần ', 'Văn E', true, birthday2, 7, 8, 9, listClass[1].Id));
    }

    private static HocSinh__c createStudent(String firstName, String lastName, Boolean sex, Date birthDay, Integer point1, Integer point2, Integer point3, Id idClass){
        HocSinh__c student =  new HocSinh__c();
        student.TenHocSinh__c = firstName;
        student.HoHocSinh__c = lastName;
        student.Lop__c = idClass;
        student.Diem1__c = point1;
        student.Diem2__c = point2;
        student.Diem3__c = point3;
        student.GioiTinh__c = sex;
        student.NgaySinh__c = birthDay;
        return student;
    }

    private static Lop__c createClass(String className) {
       Lop__c objClass = new Lop__c();
       objClass.TenLop__c = className;
       return objClass;
    }

    private static Diem__c createPoint(Id studentId, Decimal point,String subject) {
        Diem__c objPoint = new Diem__c();
        objPoint.HocSinh__c = studentId;
        objPoint.Diem__c = point;
        objPoint.Mon__c = subject;
        return objPoint;
     }
}
