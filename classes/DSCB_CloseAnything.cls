global class DSCB_CloseAnything 
{
    public String sType {get;set;}
    public String sId {get;set;}
    public list<sObject> DestinationObjectsToClose {get; set;}
    public string DestinationDisplayFieldsInCase {get; set;}// GlobalClassName Instance {get;set;}
    public String CloseCaseComments {get;set;}
    public list<DiplayVariablePack> DisplayObjects {get;set;}
    public String SummaryOutput {get;set;}
    
    global Class DiplayVariablePack
    {
        global string CaseNumber;
        global string errorMessage;
    }
    
     global Class CloseSObjectsParameters
    {
        global String Comments {get;set;}        
        global List<String> CloseIds {get;set;}  
        global String SelectedEvent {get;set;}  
    }
    
    global class ClosedErrorRecord 
    {
        public sObject Record;
        public String ErrorMessage;
        //public Map<String,CloneDisplayField> Fields;
    }
    
    global class CloseResult 
    {
        public Boolean Success;
        public String Message;
        //public Map<String,Clone_Display_Field_Settings__c> Columns;
        public List<DSCB_CloseAnything.ClosedErrorRecord> Results;        
        public CloseResult(Boolean s, String m) { Success = s; Message = m; }
    }
    
    public DSCB_CloseAnything()
    {
        sType = ApexPages.currentPage().getParameters().get('sourcetype');
        sId = ApexPages.currentPage().getParameters().get('sourceid');
        
        list<Case> recordsList = new list<Case>();       
        id Caseid = sId;
        
        if(sId != null)
        {
            //first check whether this case is child or parent, if child, then use parentid in main query
          Case caseSource = [
                Select Id, CaseNumber, ParentId                
                From Case 
                Where ID = :sId
                Limit 1
            ];
            
            if (caseSource.ParentId !=null){
                Caseid=caseSource.ParentId;
            }
            
            recordsList = [
                Select Id, CaseNumber, ParentId, 
                (Select Id, CaseNumber, ParentId, WebId__c , AccountID, Account.Name,Dealer_Group_Name__c From Cases where IsClosed=false)
                From Case 
                Where ID = :Caseid
                Limit 1
            ];
        }
      
        DestinationObjectsToClose = recordsList.get(0).getsObjects('Cases');
        DestinationDisplayFieldsInCase =  'CaseNumber, ParentId, WebId__c , AccountID,Dealer_Group_Name__c';
        System.debug('@--DestinationObjectsToClose--'+DestinationObjectsToClose);
    }
    
    @RemoteAction
    global static CloseResult CloseToSelected(CloseSObjectsParameters Parameters) 
    {   
        //String newmessage;
        CloseResult cr = new CloseResult(true, '');
        String QueryConditions = '(' + ALL_UtilitiesString.ListToCSV(Parameters.CloseIds) + ')';
        String QueryStr = 'select id,CaseNumber,Status from case where IsClosed=false and id IN' +QueryConditions;
        list<Case> AllCases = (List<sObject>)Database.query(QueryStr);
        //set savepoint        
        Savepoint sp = Database.setSavepoint();
        
        list<CaseComment> allComObjects = new list<CaseComment>();        
        for (Case eachCase :AllCases){
            //update status=closed only if user selected
            if (Parameters.SelectedEvent=='Close') {
                eachCase.status='Closed';
            }                
            //insert case comment
            CaseComment newCom = new CaseComment();
            newCom.ParentId = eachCase.id;
            newCom.CommentBody = Parameters.Comments;
            allComObjects.add(newCom); 
        }        
        try {            
            Database.SaveResult[] results = Database.insert(allComObjects, false);
            if (Parameters.SelectedEvent=='Close') {
                results=Database.update(AllCases, false);                
            } 
            system.debug('results :'+results);
            list<ClosedErrorRecord> ErrorRec = new list<ClosedErrorRecord>();            
            integer SuccessRecCount =0;
            String ResultMessage ='';
            for(integer i = 0; i < results.size(); i++) { 
                Case origRecord = AllCases[i];                
                if (!results[i].isSuccess()) {                    
                    ClosedErrorRecord ClosedErrorRec=new ClosedErrorRecord();
                    ClosedErrorRec.Record=origRecord;
                    ClosedErrorRec.ErrorMessage=results[i].geterrors()[0].getmessage();  
                    ErrorRec.add(ClosedErrorRec);                    
                } else {
                    SuccessRecCount=SuccessRecCount+1;
                }   
                ResultMessage='Total Selected : '+results.size()+', Total Success : '+SuccessRecCount+', Total Errors : '+ErrorRec.size();               
            }
            if (ErrorRec.size()>0){
               cr.Success=false;
               cr.Message=ResultMessage; 
               cr.Results=ErrorRec;  
               Database.rollback(sp);
            } else {
                cr.Success=true;
               	cr.Message=ResultMessage;                 
            }
            return cr;
        } catch(dmlexception e) {
            return new CloseResult(false, e.getMessage());
        }    
        //Database.SaveResult[] srList = Database.update(AllCases, false);
        //system.debug(srList);
    } 
    
    
   
  
    
   
}