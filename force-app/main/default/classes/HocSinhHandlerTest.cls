@isTest
public with sharing class HocSinhHandlerTest {
    @isTest
    static void testHocSinhHandler() {
       Test.startTest();
       Boolean isCheck = HocSinhHandler.isAgeValid( Date.Today(), 18 , 24);
       Test.stopTest();
       System.assertEquals(isCheck, false);
   }

   @isTest
   static void testHocSinhHandler1() {
       date myDate = date.newInstance(2003, 4, 21);
       Test.startTest();
       Boolean isCheck = HocSinhHandler.isAgeValid(myDate, 18 , 24);
       Test.stopTest();
       System.assertEquals(isCheck, true);
   }

   @isTest
   static void testHocSinhHandler2() {
       date myDate = date.newInstance(1990, 4, 21);
       Test.startTest();
       Boolean isCheck = HocSinhHandler.isAgeValid(myDate, 18 , 24);
       Test.stopTest();
       System.assertEquals(isCheck, false);
   }

   @isTest
   static void testClassification() {
        List<HocSinh__c> students = new List<HocSinh__c>();
        students = [SELECT Id, DiemTB__c FROM HocSinh__c];
        List<String> result  =  new List<String>();
        Test.startTest();
        for(HocSinh__c student : students){
           String xeploai = HocSinhHandler.classification(student);
           result.add(xeploai);
        }
       Test.stopTest();
       System.assertEquals(result[0], 'Yếu');
       System.assertEquals(result[1], 'Trung Bình');
       System.assertEquals(result[2], 'Khá');
       System.assertEquals(result[3], 'Giỏi');
   }

    private static List<Lop__c> listClass;
    private static List<HocSinh__c> listStudent;
    private static List<Diem__c> listPoint;
    static {
        listClass = new List<Lop__c>();
        listClass.add(createClass('Lop 1'));
        listClass.add(createClass('Lop 2'));
        listClass.add(createClass('Lop 3'));
        listClass.add(createClass('Lop 4'));
        insert listClass;

        listStudent = new List<HocSinh__c>();
        Date birthday = date.newInstance(2012,05,22);
        listStudent.add(createStudent('Trần ', 'Văn A', true, birthday, 2, 2, 2, listClass[0].Id));
        listStudent.add(createStudent('Trần ', 'Văn B', true, birthday, 5, 5, 5, listClass[1].Id));
        listStudent.add(createStudent('Trần ', 'Văn C', true, birthday, 7, 7, 7, listClass[2].Id));
        listStudent.add(createStudent('Trần ', 'Văn D', true, birthday, 9, 9, 9, listClass[3].Id));
        listStudent.add(createStudent('Trần ', 'Văn E', true, birthday, 7, 8, 9, listClass[1].Id));
        insert listStudent;

        listPoint = new List<Diem__c>();
        for(Integer i = 0 ; i < listStudent.size() ; i++){
           listPoint.add(createPoint(listStudent[i].Id, listStudent[i].Diem1__c , 'Hóa')) ;
           listPoint.add(createPoint(listStudent[i].Id, listStudent[i].Diem2__c , 'Lý')) ;
           listPoint.add(createPoint(listStudent[i].Id, listStudent[i].Diem3__c , 'Toán')) ;
        }
        insert listPoint;
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
