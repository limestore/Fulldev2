/*
Purpose: This class generates a map that will have sobject list for each code reference name (apex class name) as controlled in the Trigger Toggle 
custom settings. Trigger Toggle custom settings can control which record types can be passed through which code references (apex classes)

Programmer: Siva Pragada (Siva.Pragada@cdk.com)

Improvement Ideas: adding before insert, update, after insert, update for each toggle to increase the efficiency of the processing time.

History: This logic used to be with All_Case_Handler, separated to work generically for any sObject.

Edit History: Separated from ALL_Case_Handler and created on 6/9/2015 SivaP.
*/
public class ALL_TriggerToggle_Handler 
{
    public static map<string, list<sObject>> ToggleFilter(list<sObject>NewList)
    {       
        string sobjectType = ALL_UtilitiesDescribe.sObjectTypeFinder(NewList[0]);
        
        map<string, list<Trigger_Toggle__c>> TriggerTogglesRecordTypeWise = new map<string, list<Trigger_Toggle__c>>(
            ALL_TriggerToggle_Handler.getOrganizedTriggerToggles(sobjectType)
        );
        
        
        map<string, list<sObject>> RecordTypeTosObjects = new map<string, list<sObject>>(
            ALL_UtilitiesDescribe.RecordTypeTosObjects(NewList)
        ); 
        
        
        return ALL_TriggerToggle_Handler.recordWiseSobjectsOrganizer(TriggerTogglesRecordTypeWise, RecordTypeTosObjects);
    }
    
    public static map<string, list<Trigger_Toggle__c>> getOrganizedTriggerToggles(string sObjectType)
    {
        map<string, Trigger_Toggle__c> TriggerToggle = Trigger_Toggle__c.getAll();
        
        map<string, list<Trigger_Toggle__c>> TriggerTogglesRecordTypeWise = new map<string, list<Trigger_Toggle__c>>();
        
        set<string> AllCodeReferences = new set<string>();
        
        for(Trigger_Toggle__c tt: TriggerToggle.values())
        {
            AllCodeReferences.add(tt.Code_Reference__c);
            
            if(tt.sObject__c == sObjectType)
            {
                list<Trigger_Toggle__c> NullRecordTypeToggles = TriggerTogglesRecordTypeWise.get('TogglesWithNullRecordTypes');
                
                if(NullRecordTypeToggles == null)
                { 
                    NullRecordTypeToggles = new list<Trigger_Toggle__c>();
                }
                
                list<Trigger_Toggle__c> RecordTypeToggles = TriggerTogglesRecordTypeWise.get('TogglesWithRecordTypes');
                
                if(RecordTypeToggles == null)
                { 
                    RecordTypeToggles = new list<Trigger_Toggle__c>();
                }
                
                if(tt.RecordType_Name__c == null) 
                {
                    NullRecordTypeToggles.add(tt);                    
                }
                
                if(tt.RecordType_Name__c != null) 
                {
                    RecordTypeToggles.add(tt); 
                }
                
                TriggerTogglesRecordTypeWise.put('TogglesWithNullRecordTypes', NullRecordTypeToggles);
                TriggerTogglesRecordTypeWise.put('TogglesWithRecordTypes', RecordTypeToggles);
            }
        }        
        return TriggerTogglesRecordTypeWise;
    }
   
    public static map<string, list<sObject>> recordWiseSobjectsOrganizer(
        map<string, list<Trigger_Toggle__c>> TriggerTogglesRecordTypeWise, map<string, list<sobject>> RecordTypeToSobjects)
    {
        map<string, list<sObject>> SobjectsToRecordName = new map<string, list<sObject>> ();
        
        list<Trigger_Toggle__c> NullTriggerToggleList = TriggerTogglesRecordTypeWise.get('TogglesWithNullRecordTypes');
        
        if(NullTriggerToggleList != null && !NullTriggerToggleList.isEmpty())
        {
            for(Trigger_Toggle__c Toggle: NullTriggerToggleList)
            {           
                if(Toggle != null )
                {
                    string CodeReference = Toggle.Code_Reference__c;
                    
                    list<Trigger_Toggle__c> TriggerToggleList = TriggerTogglesRecordTypeWise.get('TogglesWithRecordTypes');
                    
                    if(TriggerToggleList != null && !TriggerToggleList.isEmpty())
                    {
                        for(Trigger_Toggle__c tt:  TriggerToggleList)
                        {
                            if(tt.Code_Reference__c == CodeReference)
                            {
                                if(Toggle.On__c && !tt.On__c)
                                {  
                                    list<sObject> CodeReferenceWiseSobjects = SobjectsToRecordName.get(CodeReference);
                                    
                                    for(string RecordTypeName: RecordTypeToSobjects.keySet())
                                    {                                
                                        if(CodeReferenceWiseSobjects == null)
                                        {
                                            CodeReferenceWiseSobjects = new list<sObject>();
                                        }
                                        
                                        if(RecordTypeName != tt.RecordType_Name__c)
                                        { 
                                            list<sObject> RecordTypesAndSobjects = RecordTypeToSobjects.get(RecordTypeName);
                                            if(RecordTypesAndSobjects != null && !RecordTypesAndSobjects.isEmpty())
                                            {
                                                for(sObject O:RecordTypesAndSobjects){
                                                    CodeReferenceWiseSobjects.add(O);
                                                } 
                                            }
                                        } 
                                        
                                    }                            
                                    SobjectsToRecordName.put(CodeReference, CodeReferenceWiseSobjects);                                                         
                                }
                                
                                if(!Toggle.On__c && tt.On__c)
                                {                               
                                    list<sObject> CodeReferenceWiseSobjects = SobjectsToRecordName.get(CodeReference);
                                    
                                    for(string RecordTypeName: RecordTypeToSobjects.keySet())
                                    {                        
                                        if(CodeReferenceWiseSobjects == null)
                                        {
                                            CodeReferenceWiseSobjects = new list<sObject>();                                            
                                        }
                                        
                                        if(RecordTypeName == tt.RecordType_Name__c)
                                        { 
                                            list<sObject> RecordTypesAndSobjects = RecordTypeToSobjects.get(RecordTypeName);
                                            if(RecordTypesAndSobjects != null && !RecordTypesAndSobjects.isEmpty())
                                            {
                                                for(sObject O:RecordTypesAndSobjects){
                                                    CodeReferenceWiseSobjects.add(O);
                                                }
                                            }
                                        }                                        
                                    }                            
                                    
                                    SobjectsToRecordName.put(CodeReference, CodeReferenceWiseSobjects);                                                                           
                                }
                            }
                        }
                    }
                }
            } 
        }
        system.debug(SobjectsToRecordName);
        return SobjectsToRecordName;
    }
}