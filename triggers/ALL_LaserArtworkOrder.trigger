/*------------------------------------------------------------
Description:   Trigger on LaserArtworkOrder Object
Created on:    17 August 2010.
------------------------------------------------------------
History
17 July 2015    Vishal Bandari      RQ-04982: Added code block to perform updations on Forms_Order__c Object after update 
------------------------------------------------------------*/
trigger ALL_LaserArtworkOrder on Laser_Artwork_Order__c (before insert, before update, after insert, after update) 
{    
    
    Map<Id,Laser_Artwork_Order__c> NewOrders = Trigger.newMap;
    Map<Id,Laser_Artwork_Order__c> OldOrders = Trigger.oldMap;
    
    if(Trigger.isBefore)
    {
        // set LAO fields based on Status (Time Tracking)
        if(All_CheckRecursive.runCodeBlockOnce('DS_LAO_SetFieldsBasedOnStatus_Before') || test.isRunningTest())
        {
            DS_LAO_SetFieldsBasedOnStatus.Before(Trigger.New, Trigger.Old);
        }      
        if(All_CheckRecursive.runCodeBlockOnce('ApprovalProcess.SetOwnerFieldMethod') || test.isRunningTest())
        {  
            DS_LAO_ApprovalProcess.SetOwnerFieldMethod(Trigger.New, Trigger.Old);
        } 
        //17 July 2015: Vishal Bandari added code to perform Key_Rep__c changes on related Forms_Collections__c Object
        if(All_CheckRecursive.runCodeBlockOnce('ALL_UpdateFormOrders_Handler') || test.isRunningTest())
        {
            ALL_UpdateFormOrders_Handler.updateFormsOrderChanged(Trigger.New);
        }
    }    
    // trigger for firing approval process
    if(Trigger.isAfter)
    {        
        map<Id, Profile> Profiles = new map<Id, Profile>([select Id, Name from Profile]);
        
        Profile CurrentUserProfile = Profiles.get(UserInfo.getProfileId());
        String UserProfileName = CurrentUserProfile != null ? CurrentUserProfile.Name : ''; 
        //system.debug(UserProfileName);
        
        
        // set LAO fields based on Status (Time Tracking), separate logic for after trigger
        if(All_CheckRecursive.runCodeBlockOnce('DS_LAO_SetFieldsBasedOnStatus_After') || test.isRunningTest())
        {
            DS_LAO_SetFieldsBasedOnStatus.After(Trigger.New);
        }
        
        
        //if(!UserProfileName.toLowerCase().contains('admin') || test.isRunningTest())
        // run once is already false because it is set in the before trigger functionality
        //   need to use runOtherOnce() instead
        
        //system.debug(!UserProfileName.toLowerCase().contains('admin'));
        
        //if(All_CheckRecursive.runOtherOnce() || test.isRunningTest())// && !UserProfileName.toLowerCase().contains('admin')) || test.isRunningTest())
        if((All_CheckRecursive.runCodeBlockOnce('ALL_LaserArtworkOrder_isAfter') && 
            !DS_LAO_ApprovalProcess.isSubmitted /*&& !UserProfileName.toLowerCase().contains('admin')*/) 
           || test.isRunningTest()) 
        {           
            // trigger for firing approval process whenever certain field criteria is met           
            DS_LAO_ApprovalProcess.ApprovalProcessMethod(Trigger.New, Trigger.Old);                              
        }        
        
    }     
}