@isTest
private class TestLanguageCourseTrigger {
    
    @isTest static void TestCreateLanguageCourse() {
        Language_Course_Instructor__c lci = new Language_Course_Instructor__c(
            Name = 'Gerald'
        );
        insert lci;

        Language_Course__c languageCourse = new Language_Course__c(
            Name = 'New Language Course',
            Course_Instructor__c = lci.Id
        );

        Test.startTest();
        insert languageCourse;
        Test.stopTest();

        List<Language_Course__c> courses = [SELECT Id, Name FROM Language_Course__c WHERE Id != null ];
        System.assert(courses.size() == 1, 'Too many courses');
        System.assert(courses.get(0).Name == 'New Language Course', 'Name Wrong');
        
    }
}
