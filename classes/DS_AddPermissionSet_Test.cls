@isTest
public class DS_AddPermissionSet_Test 
{    
        
    private static final boolean GENERATE_DEBUG_LOGS = true;
    //TestMethod control variables
    private static final boolean RUN_ALL = true;
    private static final boolean RUN_ADD_PERMISSIONSETS = true;
    
    @TestSetup   
    public static void loadData()
    {
        User currentUser = [Select id From User where Id =:userInfo.getUserId()];
        System.runAs(currentUser)
        {
            PermissionSet permObj1 = new PermissionSet();
            permObj1.Description='Test Description';
            permObj1.Label='Test Permission Set';
            permObj1.Name='TestPermissionSet1';
            insert permObj1; 
            
            PermissionSet permObj2 = new PermissionSet();
            permObj2.Description='Test Description 2';
            permObj2.Label='Test Permission Set 2';
            permObj2.Name='TestPermissionSet2';
            insert permObj2;
            
            Group groupObj1 = new Group();
            groupObj1.Name = 'Test Group1';
            groupObj1.DeveloperName='TestGroup1';
            groupObj1.DoesIncludeBosses = false;
            groupObj1.Type='Regular';
            insert groupObj1;
            
            Group groupObj2 = new Group();
            groupObj2.Name = 'Test Group2';
            groupObj2.DeveloperName='TestGroup2';
            groupObj2.DoesIncludeBosses = false;
            groupObj2.Type='Regular';
            insert groupObj2;
            
            Assign_PermissionSets__c customSettingObj1 = new Assign_PermissionSets__c();
            customSettingObj1.Name='Record 1';
            customSettingObj1.Field_Name__c='Title';
            customSettingObj1.Field_Value__c='Salesforce Developer';
            customSettingObj1.Operator__c='==';
            customSettingObj1.Group_ID__c=groupObj1.Id;
            insert customSettingObj1;
            
            Assign_PermissionSets__c customSettingObj2 = new Assign_PermissionSets__c();
            customSettingObj2.Name='Record 2';
            customSettingObj2.Field_Name__c='Department';
            customSettingObj2.Field_Value__c='Sales Automation';
            customSettingObj2.Group_ID__c=groupObj1.id;
            customSettingObj2.Operator__c='==';
            customSettingObj2.PermissionSet_ID__c=permObj1.Id;
            insert customSettingObj2;
            
            Assign_PermissionSets__c customSettingObj3 = new Assign_PermissionSets__c();
            customSettingObj3.Name='Record 3';
            customSettingObj3.Field_Name__c='Title';
            customSettingObj3.Field_Value__c='Salesforce Developer';
            customSettingObj3.Operator__c='==';
            customSettingObj3.PermissionSet_ID__c=permObj1.Id;
            insert customSettingObj3;     
            
            Assign_PermissionSets__c customSettingObj4 = new Assign_PermissionSets__c();
            customSettingObj4.Name='Record 4';
            customSettingObj4.Field_Name__c='Title';
            customSettingObj4.Field_Value__c='Salesforce Developer';
            customSettingObj4.Operator__c='==';
            customSettingObj4.Group_ID__c=groupObj2.id;
            insert customSettingObj4; 
            
            Assign_PermissionSets__c customSettingObj5 = new Assign_PermissionSets__c();
            customSettingObj5.Name='Record 5';
            customSettingObj5.Field_Name__c='Title';
            customSettingObj5.Field_Value__c='Salesforce Developer';
            customSettingObj5.Operator__c='==';
            customSettingObj5.PermissionSet_ID__c=permObj2.id;
            insert customSettingObj5; 
            
            Assign_PermissionSets__c customSettingObj6 = new Assign_PermissionSets__c();
            customSettingObj6.Name='Record 6';
            customSettingObj6.Field_Name__c='EmployeeNumber';
            customSettingObj6.Field_Value__c='1111';
            customSettingObj6.Operator__c='>=';
            customSettingObj6.Group_ID__c=groupObj1.id;
            insert customSettingObj6; 
            
            Assign_PermissionSets__c customSettingObj7 = new Assign_PermissionSets__c();
            customSettingObj7.Name='Record 7';
            customSettingObj7.Field_Name__c='Title';
            customSettingObj7.Field_Value__c='Salesforce Developer';
            customSettingObj7.Operator__c='==';
            customSettingObj7.Group_ID__c=permObj2.id;
            insert customSettingObj7; 
            
            Assign_PermissionSets__c customSettingObj8 = new Assign_PermissionSets__c();
            customSettingObj8.Name='Record 8';
            customSettingObj8.Field_Name__c='Title';
            customSettingObj8.Field_Value__c='Salesforce Developer';
            customSettingObj8.Operator__c='==';
            customSettingObj8.PermissionSet_ID__c=groupObj2.id;
            insert customSettingObj8; 
        }
    }
    
    public static testMethod void testAddPermissionSets()
    {
        if(RUN_ADD_PERMISSIONSETS || RUN_ALL)
        {
            User currentUser = [Select id From User where Id =:userInfo.getUserId()];
            System.runAs(currentUser)
            {
                PermissionSet permObj = [select id from PermissionSet where Name='TestPermissionSet1' limit 1];
                Group groupObj = [select id from Group where Name='Test Group1' limit 1];
                
                List<PermissionSetAssignment> tempPermissionSetAssignmentList = [
                    select id,AssigneeId,permissionSetId 
                    from PermissionSetAssignment 
                    where permissionSetId=:permObj.Id
                ] ;
                System.assertEquals(0, tempPermissionSetAssignmentList.size());                
                
                List<GroupMember> testGroupMemberList = [
                    select id,UserOrGroupId,groupId 
                    from GroupMember 
                    where groupId=:groupObj.Id
                ] ;

                System.assertEquals(0, testGroupMemberList.size());    
                
                Test.startTest();
                List<User> userList = new List<User>();
                for(integer i=0;i<2;i++)
                {
                    User userObj = DS_TestObjects.NewUser();
                    if(i==0)
                    {
                        userObj.LastName = 'testUser1';
                        userObj.Title = 'Salesforce Developer';
                        userObj.Department = 'Sales Automation';  
                        userObj.EmployeeNumber = '9999';
                    }
                    else
                    {
                        userObj.LastName = 'testUser2';
                        userObj.Title = 'Salesforce';
                        userObj.Department = 'Sales'; 
                    }
                    userList.add(userObj);
                }
                insert userList;
                DS_AddPermissionSet_Handler.addPermissionSetsAndGroups(userList);
                Test.stopTest();
                User userObj = [select id from User where lastName='testUser1' Limit 1];
                
                List<PermissionSetAssignment> permissionSetAssignmentList = [
                    select id,AssigneeId,permissionSetId 
                    from PermissionSetAssignment 
                    where AssigneeId=:userObj.Id 
                    and permissionSetId=:permObj.Id
                ] ;
                
                System.assertEquals(1, permissionSetAssignmentList.size());
                
                List<GroupMember> groupMemberList = [
                    select id,UserOrGroupId,groupId 
                    from GroupMember 
                    where groupId=:groupObj.Id
                ] ;
                System.assertEquals(1, groupMemberList.size());    
                
            }            
        }
        
    }
}