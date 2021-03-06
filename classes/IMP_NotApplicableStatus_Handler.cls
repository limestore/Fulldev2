/*------------------------------------------------------------
    Author:      Kimiko Roberto
    Company:     Cloud Sherpas
    Description: Blanks out Planned dates and actual days spent if not applicable reason has value
    Inputs:      
    Returns:     
    History
    03/05/15     Kimiko Roberto    Created
------------------------------------------------------------*/
public class IMP_NotApplicableStatus_Handler
{
    
    public static void blankPlannedDatesActualDaysSpent(List<Project_Task__c> newProjectTaskList)
    {
        //reset date and actual days spent to blank when not applicable reason has value
        for(Project_Task__c newProjectTask : newProjectTaskList)
        {
            newProjectTask.Planned_Start_Date__c = null;
            newProjectTask.Planned_End_Date__c = null;
            newProjectTask.Actual_Time_Spent__c = null;
        }
    }
}