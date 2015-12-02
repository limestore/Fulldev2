/*------------------------------------------------------------
Author:        Vishal Bandari
Description:   Extension for Subproject_On_LAO Visual Force Page
Created on:    30 July 2015.
Test Class:    IMP_UpdateFormsOrder_Test
Code Coverage: 100%
------------------------------------------------------------
History
30 July 2015    Vishal Bandari      RQ-04982: Added getRecordDetails method
------------------------------------------------------------*/
public class Subproject_On_Laser_Extension
{
    private Id LAO_RecordId;
    
    public SubProject_External_Reference__c sperObj {get;set;}
    
    public Laser_Artwork_Order__c laoObj{get;set;}
    
    public Subproject_On_Laser_Extension(ApexPages.StandardController stdController)
    {
        LAO_RecordId = stdController.getId();
    }
    
    public void getRecordDetails()
    {
        try
        {
            laoObj = [
                SELECT Id, Request_ID_RMS__c, Request_ID_RMS_Link__c 
                FROM Laser_Artwork_Order__c 
                WHERE Id =: LAO_RecordId
            ];
            
            sperObj = [
                SELECT SubProject__c,SubProject__r.Confidential__c,SubProject__r.Name, SubProject__r.Go_Live_Date__c, SubProject__r.Project_Manager__c, 
                SubProject__r.Impact_Project_Numbers__c, SubProject__r.Contract_Roll_Called__c
                FROM SubProject_External_Reference__c 
                WHERE LAO_ID__c =: LAO_RecordId
            ];  
        }
        catch(Exception e)
        {
            System.debug('Exception: '+e.getMessage()+' At '+e.getLineNumber());
        }
    }
    public PageReference save()
    {
        update laoObj;
        laoObj = [
            SELECT Id, Request_ID_RMS__c, Request_ID_RMS_Link__c 
            FROM Laser_Artwork_Order__c 
            WHERE Id =: LAO_RecordId
        ];
        return null;
    }
    public PageReference cancel()
    {
        return null;
    }
}