/*------------------------------------------------------------
Author: Michael Lasala
Company: Cloud Sherpas
Description: Consolidated Project Task triggers
Test Class:
History
02/04/2015    Kimiko Roberto    Created
03/14/2015    Kimiko Roberto    Updated trigger structure to have proper filters for calling methods
04/02/2015    Samuel Oberes     Added custom setting usage for bypassing the validation of past actual end dates in the BEFORE-INSERT and UPDATE context
04/14/2015    Samuel Oberes     Changed way on how to check equality for Users_Excluded_from_Business_Rules__c field
04/15/2015    Kimiko Roberto    Rearranged logic to process rollups first before ending terminal tasks/activities
05/06/2015    Samuel Oberes     Added invocation of error whenever a completed task is attempted to be deleted
05/12/2015    Samuel Oberes     Added Project_ID__c and SubProject_ID__c for the query in the AFTER INSERT and UPDATE context
05/19/2015    Kimiko Roberto    Added IMP_NotApplicableStatus_Handler to isBefore's insert and update to blank out Planned dates and actual days spent if not applicable reason has value.
05/21/2015    Kimiko Roberto    Added bypass mechanism to expected time spent
06/10/2015    Rey Austral       Added merge function for the rollup
06/11/2015    Rey Austral       Add the merge function for the rollup in the is after delete
06/17/2015    Rey Austral       Remove IMP_PostFeedToAsignee_Handler
06/19/2015    Rey Austral       Add roll down function
------------------------------------------------------------*/
trigger IMP_ProjectTask on Project_Task__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
    if (Trigger.isBefore) 
    {
        CustomSettings__c cs = CustomSettings__c.getInstance();
        Boolean currentUserIsExcludedFromRules = false;
        
        if (cs.Users_Excluded_from_Business_Rules__c != null) 
        {
            if (cs.Users_Excluded_from_Business_Rules__c.contains(UserInfo.getName()))
            {
                currentUserIsExcludedFromRules = true;
            }
        }
        
        if(Trigger.isInsert)
        {
            /*
            //Removed
            if (!currentUserIsExcludedFromRules) 
            {
            //Checks if Actual End Dates are set to the past
            
            IMP_ActualEndDatesValidationHandler.checkPastActualEndDates(Trigger.New, null);       
            
            }
            */
                        //reset date and actual days spent to blank when not applicable reason has value
                        /*
            for(Project_Task__c pt : Trigger.New)
            {
            if(pt.Reason__c != null)
            { 
            IMP_NotApplicableStatus_Handler.blankPlannedDatesActualDaysSpent(Trigger.New);
            }
            }
            */
            
            for(Project_Task__c pt: Trigger.New)
            {               
                
                if (pt.Project_Activity_CDK_Assignee__c != null && pt.CDK_Assignee__c == null)
                {   
                    pt.CDK_Assignee__c = pt.Project_Activity_CDK_Assignee__c;                  
                }
                
                if (pt.Project_Activity_Client_Assignee__c != null && pt.Client_Assignee__c == null)
                {
                    pt.Client_Assignee__c = pt.Project_Activity_Client_Assignee__c;
                }
            }
        } 
        else if(Trigger.isUpdate)
        {
            /*
            //Removed
            if (!currentUserIsExcludedFromRules) 
            {
            //Checks if Actual End Dates are set to the past
            
            IMP_ActualEndDatesValidationHandler.checkPastActualEndDates(Trigger.New, Trigger.OldMap);
            
            }
            */
                        //determines if a user can bypass updating expected time spent or not
                        /*
            Boolean cannotUpdateExpectedTimeSpent = false;
            system.Debug('***profile: '+IMP_Project_Utility.profileCanByPass('Expected_Time_Spent__c', UserInfo.getProfileId()));
            system.Debug('***permset: '+IMP_Project_Utility.permissionSetCanByPass('Expected_Time_Spent__c', UserInfo.getUserId()));             
            if(!IMP_Project_Utility.profileCanByPass('Expected_Time_Spent__c', UserInfo.getProfileId()) && !IMP_Project_Utility.permissionSetCanByPass('Expected_Time_Spent__c', UserInfo.getUserId()))
            {
            cannotUpdateExpectedTimeSpent = true;
            }
            */
            // 08/17/15- Venkata Shrivol - Added below two boolean values to bring the profileCanByPass and permissionSetCanByPass methods outside loop
            
            boolean profileCanByPassInTrigger = false;
            boolean permissionSetCanByPassInTrigger = false;
            profileCanByPassInTrigger = IMP_Project_Utility.profileCanByPass('ByPass_Complete_Task_Edit', UserInfo.getProfileId());
            permissionSetCanByPassInTrigger = IMP_Project_Utility.permissionSetCanByPass('ByPass_Complete_Task_Edit', UserInfo.getUserId());
 
            Map<Id,Boolean> profileCanBypassMap = IMP_Project_Utility.userCanByPass(Profile.sObjectType);
            Map<Id,Boolean> permissionCanBypassMap = IMP_Project_Utility.userCanByPass(PermissionSetAssignment.sObjectType);
            system.Debug('**Profiles: ' + profileCanBypassMap);
            system.Debug('**userprofile: ' + UserInfo.getProfileId());
            system.Debug('**permission: ' + permissionCanBypassMap);
            system.Debug('**userId: ' + UserInfo.getUserId());
            IMP_IncrementActivityOrMilestone_Handler.IncrementCounterField(Trigger.oldMap, Trigger.New);
            
            //Clone if the task is complete and has fail migration status
            List<Project_Task__c> taskToCloneList = new List<Project_Task__c>();
            for(Project_Task__c pt: Trigger.newMap.values())
            {
                if (Trigger.oldMap.containsKey(pt.id)) 
                {
                    Project_Task__c ptOld = Trigger.oldMap.get(pt.id);
                    // 08/07/2015 Karl Simon  Added Access_to_PM_Maintenance permission set to IMP_ProfilestoByPass entry for 'ByPass_Complete_Task_Edit' entry, and updated code below to check permission sets.
                    if (ptOld.Status__c == IMP_Project_Utility.STATUS_COMPLETE && currentUserIsExcludedFromRules == false && !profileCanByPassInTrigger && !permissionSetCanByPassInTrigger
                       && IMP_Project_Utility.checkTaskFieldIfChange(pt,ptOld) == true)
                    {
                        pt.addError(IMP_String_Utility.NO_BYPASS_TOUPDATE_TASK);
                    }
                    else
                    {
                        //validate the old value, so that the clone will not trigger every time the user change something that is not the migration status
                        if (ptOld.Status__c != IMP_Project_Utility.STATUS_COMPLETE || (ptOld.Migration_Status__c == 'Success' || ptOld.Migration_Status__c == 'Task Not Performed'))
                        {
                            //validate if the new value is accepted for clonning
                            if (pt.Status__c == IMP_Project_Utility.STATUS_COMPLETE &&  !(pt.Migration_Status__c == 'Success' || pt.Migration_Status__c == 'Task Not Performed') && pt.Migration_Status__c != null
                                && pt.Was_Cloned_to_New_Migration_Task__c == false) 
                            {    
                                try 
                                {
                                    //add the clone record in the list
                                    taskToCloneList.add(IMP_Project_Utility.cloneProjectTaskField(pt));
                                    //change the value of this field to mark the old record have already been cloned and will not be clone again, even if the migration status has been change
                                    pt.Was_Cloned_to_New_Migration_Task__c = true;                                    
                                } 
                                catch(Exception ex) 
                                {
                                    pt.addError('Error in cloning the task : ' + ex.getMessage());
                                }
                                
                            } 
                        }
                        //Action tracker #166, reset date when not applicable reason has value
                        if (ptOld.Reason__c == null && pt.Reason__c != null) 
                        {
                            IMP_NotApplicableStatus_Handler.blankPlannedDatesActualDaysSpent(Trigger.New);
                        }
                        
                        // Expected Days Spent is a field that should only be editable during the creation of a Project Task
                        // it should not be allowed to be updated
                        if(ptOld.Expected_Time_Spent__c != pt.Expected_Time_Spent__c)
                        {
                            if(profileCanBypassMap.get(UserInfo.getProfileId()) == null && permissionCanBypassMap.get(UserInfo.getUserId()) == null)
                            {
                                pt.Expected_Time_Spent__c = ptOld.Expected_Time_Spent__c;
                            }
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            
            if (!taskToCloneList.isEmpty()) 
            {
                try 
                {
                    insert taskToCloneList;
                }
                catch (Exception ex) 
                {
                    System.debug('$$$ Insert Task to Clone Exception: '+ ex);
                }
                
            }
            
        } 
        else if(Trigger.isDelete)
        {
            
            /*for removal
            IMP_ProjectActivityContacts_Handler_2.beforeDeleteValuesPT = [SELECT Id, CDK_Assignee__c, Client_Assignee__c, Project_Activity__r.Milestone__r.Subproject__c
            FROM Project_Task__c 
            WHERE Id IN :Trigger.Old];
            
            system.debug('**IMP_ProjectActivityContacts_Handler_2.beforeDeleteValuesPT: '+IMP_ProjectActivityContacts_Handler_2.beforeDeleteValuesPT);                              
            */
            
            for(Project_Task__c taskToDelete : Trigger.oldMap.values())
            {
                if (taskToDelete.Status__c == IMP_Project_Utility.STATUS_COMPLETE && currentUserIsExcludedFromRules == false)
                {
                    String[] arguments = new String[] { taskToDelete.Description__c };                                                  
                    taskToDelete.addError(String.format(IMP_String_Utility.NO_BYPASS_TODELETE_TASK, arguments));
                   
                }
            }
        }
        
    } 
    else if (Trigger.isAfter) 
    {
        
        List<Project_Task__c> expectedDurationRollupsList = new List<Project_Task__c>();
        List<Project_Task__c> activityRollupsList = new List<Project_Task__c>();
        //IMP_ProjectActivityContacts_Handler_2.createOrUpdateContacts(Trigger.oldMap, Trigger.old, Trigger.New, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete, Project_Task__c.SObjectType);
        
        // ------------------------------------------------------------------------------------------------------------------------
        // ------------------------------------------------------------------------------------------------------------------------
        /*
        Map<Id, Date> activityActualEndDateMap = new Map<Id, Date>();
        Set<Id> activityToEndSet = new Set<Id>();
        
        if(Trigger.isInsert || Trigger.isUpdate)
        {
        
        for(Project_Task__c pt: Trigger.New)
        {
        
        //Only process records for Terminal Activity = true and Actual End Date != null
        if(pt.Terminal_Task__c && pt.Actual_End_Date__c != null)
        {
        
        //Put key and values to map to be used for handler
        activityActualEndDateMap.put(pt.Project_Activity__c, pt.Actual_End_Date__c);
        
        //Add Project Milestone Id to be used for query
        activityToEndSet.add(pt.Project_Activity__c);
        }
        }
        system.Debug('**activityActualEndDateMap'+activityActualEndDateMap);
        }
        */
        
        
        if(Trigger.isInsert)
        {
            
            //collect the newly assigned users from the project activity
            List<Project_Task__c> prjTaskList = [SELECT Id,
                                                 Description__c,
                                                 Planned_Start_Date__c,
                                                 Planned_End_Date__c,
                                                 SubProject_ID__c,
                                                 Project_ID__c,
                                                 CDK_Assignee__c,
                                                 CDK_Assignee__r.Name,
                                                 Status__c,
                                                 NotifyWhenComplete__c,
                                                 Project_Activity__r.Description__c,
                                                 Project_Activity__r.Milestone__r.Description__c,
                                                 Project_Activity__c,
                                                 Project_Activity__r.Milestone__c
                                                 FROM Project_Task__c
                                                 WHERE CDK_Assignee__c != null
                                                 AND Id IN : Trigger.New];
            Set<Id> subprj = new Set<Id>();
            //get the Subproject id from the project activity to be able to set them as followers
            for(Project_Task__c prj : prjTaskList)
            {
                subprj.add(prj.SubProject_ID__c);
            }
            
            
            //post a feed to the asignee and add him as a follower to the project and subproject if still not following
            //disable post feed function UAT-272 - Rey Austral
            //if(prjTaskList != null && !prjTaskList.isEmpty())
           // {
           //     IMP_PostFeedToAsignee_Handler.postToChatterFeed(prjTaskList, null, subprj );
            //}
            
            for(Project_Task__c prjTask : Trigger.New)
            {
                if((prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0) || 
                   (prjTask.Actual_Time_Spent__c != null && prjTask.Actual_Time_Spent__c != 0) || 
                   (prjTask.Actual_Start_Date__c != null)    ||
                   (prjTask.Actual_End_Date__c != null))
                {
                    activityRollupsList.add(prjTask);
                }   
                
                if(prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0)
                {
                    expectedDurationRollupsList.add(prjTask);
                }
            }
            
            List<sObject> activityToUpdateList = new List<sObject>();
            List<sObject> activityExpectedDurationList = new List<sObject>();
            if(activityRollupsList  != null && !activityRollupsList.isEmpty())
            {
                //IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
                activityToUpdateList = IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
            }
            
            if(expectedDurationRollupsList != null && !expectedDurationRollupsList.isEmpty())
            {    
                //IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
                activityExpectedDurationList = IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
            }
            
            List<sObject> activityToUpdateFinalList = new List<sObject>();
            if(activityToUpdateList  != null && !activityToUpdateList.isEmpty() && activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList =  IMP_BuildActivityRollups_Handler.mergeRollup(activityToUpdateList,activityExpectedDurationList);
            } 
            else if (activityToUpdateList  != null && !activityToUpdateList.isEmpty())
            {
                activityToUpdateFinalList = activityToUpdateList;
            }
            else if(activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList = activityExpectedDurationList;
            }
            
            if (activityToUpdateFinalList != null && !activityToUpdateFinalList.isEmpty())
            {
                update activityToUpdateFinalList;
            }
            /*
            if(!activityToEndSet.isEmpty())
            {
            System.debug('$$$ activityToEndSet: '+activityToEndSet);
            
            //Process terminal activities mistakenly end dated, due to 1 or more non-terminal activity siblings existing with no end date
            Map<Id, Boolean> terminalProjectTaskIdtoSuccessMap = IMP_Project_Utility.updateParentActualEndDate(activityActualEndDateMap, activityToEndSet, Project_Task__c.SObjectType);
            
            Boolean projTaskinMap = false;
            
            System.debug('$$$ The size of terminalProjectTaskIdtoSuccessMap is ' + terminalProjectTaskIdtoSuccessMap.size());
            if(terminalProjectTaskIdtoSuccessMap.size() > 0){
            for(Project_Task__c pt: Trigger.new){
            projTaskinMap = terminalProjectTaskIdtoSuccessMap.containskey(pt.Id);
            if (projTaskinMap) {
            pt.addError('Terminal task can not be end-dated, if an Activity has 1 or more non-terminal tasks which have not yet been end-dated.');
            }
            }
            }
            }
            */
            /*
        for(Project_Task__c prjTask : Trigger.New)
        {
        if((prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0) || 
        (prjTask.Actual_Time_Spent__c != null && prjTask.Actual_Time_Spent__c != 0) || 
        (prjTask.Actual_Start_Date__c != null))
        {
        activityRollupsList.add(prjTask);
        }   
        
        if(prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0)
        {
        expectedDurationRollupsList.add(prjTask);
        }
        }
        
        if(activityRollupsList  != null && !activityRollupsList.isEmpty())
        {
        IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
        }
        
        if(expectedDurationRollupsList != null && !expectedDurationRollupsList.isEmpty())
        {    
        IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
        }
        */
        }
        else if(Trigger.isUpdate)
        {
            
            //collect the newly assigned users from the project activity
            List<Project_Task__c> prjTask = [SELECT Id,
                                             Description__c,
                                             Planned_Start_Date__c,
                                             Planned_End_Date__c,
                                             SubProject_ID__c,
                                             Project_ID__c,
                                             CDK_Assignee__c,
                                             CDK_Assignee__r.Name,
                                             Status__c,
                                             NotifyWhenComplete__c,
                                             Project_Activity__r.Description__c,
                                             Project_Activity__r.Milestone__r.Description__c,
                                             Project_Activity__c,
                                             Project_Activity__r.Milestone__c
                                             FROM Project_Task__c
                                             WHERE CDK_Assignee__c != null
                                             AND Id IN : Trigger.New];
            
            Set<Id> subprj = new Set<Id>();
            //get the Subproject id from the project activity to be able to set them as followers
            for(Project_Task__c prj : prjTask)
            {
                subprj.add(prj.SubProject_ID__c);
            }
            
            for(Project_Task__c newPrjTask : Trigger.New)
            {
                Project_Task__c oldPrjTask = Trigger.OldMap.get(newPrjTask.Id);
                if((newPrjTask.Expected_Time_Spent__c != oldPrjTask.Expected_Time_Spent__c) ||
                   (newPrjTask.Actual_Time_Spent__c != oldPrjTask.Actual_Time_Spent__c) || 
                   (newPrjTask.Actual_Start_Date__c != oldPrjTask.Actual_Start_Date__c) ||
                   (newPrjTask.Actual_End_Date__c != oldPrjTask.Actual_End_Date__c)    || 
                   (newPrjTask.Status__c != oldPrjTask.Status__c) && newPrjTask.Status__c != 'Assigned')
                {
                    activityRollupsList.add(newPrjTask);
                }   
                
                if(newPrjTask.Expected_Time_Spent__c != oldPrjTask.Expected_Time_Spent__c    || 
                   newPrjTask.Status__c != oldPrjTask.Status__c && newPrjTask.Status__c != 'Assigned')
                {
                    expectedDurationRollupsList.add(newPrjTask);
                }
            }
            /*
            if(activityRollupsList  != null && !activityRollupsList.isEmpty())
            {
            IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
            }
            
            if(expectedDurationRollupsList != null && !expectedDurationRollupsList.isEmpty())
            {    
            IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
            }
            */
            
            List<sObject> activityToUpdateList = new List<sObject>();
            List<sObject> activityExpectedDurationList = new List<sObject>();
            if(activityRollupsList  != null && !activityRollupsList.isEmpty())
            {
                //IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
                activityToUpdateList = IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
            }
            
            if(expectedDurationRollupsList != null && !expectedDurationRollupsList.isEmpty())
            {    
                //IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
                activityExpectedDurationList = IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
            }
            
            List<sObject> activityToUpdateFinalList = new List<sObject>();
            if(activityToUpdateList  != null && !activityToUpdateList.isEmpty() && activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList =  IMP_BuildActivityRollups_Handler.mergeRollup(activityToUpdateList,activityExpectedDurationList);                
            } 
            else if (activityToUpdateList  != null && !activityToUpdateList.isEmpty())
            {
                activityToUpdateFinalList = activityToUpdateList;               
            }
            else if(activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList = activityExpectedDurationList;              
            }
            
            if (activityToUpdateFinalList != null && !activityToUpdateFinalList.isEmpty())
            {
                update activityToUpdateFinalList;
            }
            /*
            if(!activityToEndSet.isEmpty())
            {
            System.debug('$$$ activityToEndSet: '+activityToEndSet);
            
            //Process terminal activities mistakenly end dated, due to 1 or more non-terminal activity siblings existing with no end date
            Map<Id, Boolean> terminalProjectTaskIdtoSuccessMap = IMP_Project_Utility.updateParentActualEndDate(activityActualEndDateMap, activityToEndSet, Project_Task__c.SObjectType);
            
            Boolean projTaskinMap = false;
            
            System.debug('$$$ The size of terminalProjectTaskIdtoSuccessMap is ' + terminalProjectTaskIdtoSuccessMap.size());
            if(terminalProjectTaskIdtoSuccessMap.size() > 0)
            {
            for(Project_Task__c pt: Trigger.new)
            {
            projTaskinMap = terminalProjectTaskIdtoSuccessMap.containskey(pt.Id);
            if (projTaskinMap)
            {
            pt.addError('Terminal task can not be end-dated, if an Activity has 1 or more non-terminal tasks which have not yet been end-dated.');
            }
            }
            }
            }
            */
            
            //post a feed to the asignee and add him as a follower to the project and subproject if still not following
            //disable post feed function UAT-272 - Rey Austral
            //if(prjTask != null && !prjTask.isEmpty())
            //{
            //    IMP_PostFeedToAsignee_Handler.postToChatterFeed(prjTask , Trigger.OldMap, subprj );
            //}
            
            
            
        }
        else if(Trigger.isDelete)
        {
            
            for(Project_Task__c prjTask : Trigger.Old)
            {
                if((prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0) || 
                   (prjTask.Actual_Time_Spent__c != null && prjTask.Actual_Time_Spent__c != 0) || 
                   (prjTask.Actual_Start_Date__c != null)    || 
                   (prjTask.Actual_End_Date__c != null))
                {
                    activityRollupsList.add(prjTask);
                }   
                
                if(prjTask.Expected_Time_Spent__c != null && prjTask.Expected_Time_Spent__c != 0)
                {
                    expectedDurationRollupsList.add(prjTask);
                }  
            }
            
            List<sObject> activityToUpdateList = new List<sObject>();
            List<sObject> activityExpectedDurationList = new List<sObject>();
            if(activityRollupsList  != null && !activityRollupsList.isEmpty())
            {
                //IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
                activityToUpdateList = IMP_BuildActivityRollups_Handler.createActivityRollups(activityRollupsList);    
            }
            
            if(expectedDurationRollupsList != null && !expectedDurationRollupsList.isEmpty())
            {    
                //IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
                activityExpectedDurationList = IMP_BuildActivityRollups_Handler.createExpectedDurationRollup(expectedDurationRollupsList);
            }
            
            List<sObject> activityToUpdateFinalList = new List<sObject>();
            if(activityToUpdateList  != null && !activityToUpdateList.isEmpty() && activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList =  IMP_BuildActivityRollups_Handler.mergeRollup(activityToUpdateList,activityExpectedDurationList);                
            } 
            else if (activityToUpdateList  != null && !activityToUpdateList.isEmpty())
            {
                activityToUpdateFinalList = activityToUpdateList;               
            }
            else if(activityExpectedDurationList != null && !activityExpectedDurationList.isEmpty())
            {
                activityToUpdateFinalList = activityExpectedDurationList;              
            }
            
            if (activityToUpdateFinalList != null && !activityToUpdateFinalList.isEmpty())
            {
                update activityToUpdateFinalList;
            }
        } 
    }
}