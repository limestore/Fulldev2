<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>DS_BDC_DocusignAnysigner_Approved</fullName>
        <description>DS_BDC_DocusignAnysigner_Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>patti.spelman@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>BDC_Docs/BDC_DocusignAnysigner_Approved</template>
    </alerts>
    <alerts>
        <fullName>DS_BDC_DocusignAnysigner_CRA</fullName>
        <description>DS_BDC_DocusignAnysigner_CRA</description>
        <protected>false</protected>
        <recipients>
            <recipient>patti.spelman@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>BDC_Docs/BDC_DocusignAnysigner_CRA</template>
    </alerts>
    <alerts>
        <fullName>DS_BDC_DocusignAnysigner_Countersigner</fullName>
        <description>DS_BDC_DocusignAnysigner_Countersigner</description>
        <protected>false</protected>
        <recipients>
            <recipient>patti.spelman@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>BDC_Docs/BDC_DocusignAnysigner_Countersigner</template>
    </alerts>
    <alerts>
        <fullName>DS_BDC_DocusignAnysigner_Reject</fullName>
        <description>DS_BDC_DocusignAnysigner_Reject</description>
        <protected>false</protected>
        <recipients>
            <recipient>patti.spelman@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>BDC_Docs/BDC_DocusignAnysigner_Reject</template>
    </alerts>
    <alerts>
        <fullName>DS_SlsOps_eFaxAccountChanges</fullName>
        <ccEmails>ds.helpmit@adp.com</ccEmails>
        <description>DS_SlsOps_eFaxAccountChanges</description>
        <protected>false</protected>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sales_Automation_Templates/eFax_Account_Changes</template>
    </alerts>
    <alerts>
        <fullName>IT_Request_ColumnTypeChg_Set</fullName>
        <description>IT_Request_ColumnTypeChg_Set</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.hanson@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>irfan.siddiqui@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/IT_Request_DataTypeChg</template>
    </alerts>
    <alerts>
        <fullName>New_Request_Created_Notification</fullName>
        <description>New Request Created Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/New_Request_Created</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_1_Day_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_1_Day_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Request_Case_Notification_1_Day_old</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_2_Hours_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_2_Hours_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Request_Case_Notification_2_Hours</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_4_Hours_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_4_Hours_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Request_Case_Notification_4_Hours</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_Critical_4Hours_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_Critical_4Hours_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.hanson@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Critical_Case_Notification_4_Hour_No_Activity</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_High_12Hours_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_High_12Hours_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.hanson@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/High_Case_Notification_12_Hour_No_Activity</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_Mass_Hysteria</fullName>
        <description>SalesAuto_Request_Alrt_Mass_Hysteria</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Mass_Hysteria_Case_Notification</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_Mass_Hysteria_1_hour_no_activity</fullName>
        <description>SalesAuto_Request_Alrt_Mass_Hysteria - 1 hour no activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Mass_Hysteria_Case_Notification_1_Hour_No_Activity</template>
    </alerts>
    <alerts>
        <fullName>SalesAuto_Request_Alrt_Std_24Hours_No_Activity</fullName>
        <description>SalesAuto_Request_Alrt_Std_24Hours_No_Activity</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.hanson@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Standard_Notification_24_Hour_No_Activity</template>
    </alerts>
    <alerts>
        <fullName>Sales_Automation_Request_Completed_Notification_to_Creator</fullName>
        <description>Sales Automation Request Completed Notification to Creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>SalesAutomationAdmins</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Sales_Automation_Request_Completed</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_that_changes_are_in_training_from_Request</fullName>
        <description>Send notification that changes are in training from Request</description>
        <protected>false</protected>
        <recipients>
            <field>QA_Tester__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Automation_Templates/Changes_In_Training_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>CB_REQUEST_UPD_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>RequestQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>CB_REQUEST_UPD_Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CB_Request_DateTimeClosed</fullName>
        <field>Date_Time_Closed__c</field>
        <formula>NOW()</formula>
        <name>CB_Request_DateTimeClosed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CB_Request_DateTimeClosed_Clear</fullName>
        <field>Date_Time_Closed__c</field>
        <name>CB_Request_DateTimeClosed_Clear</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CB_Request_DateTime_Completed_in_FullDev</fullName>
        <field>Date_Time_Completed_in_FullDev__c</field>
        <formula>Now()</formula>
        <name>CB_Request_DateTime_Completed_in_FullDev</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CB_Request_DateTime_Completed_in_Product</fullName>
        <field>Date_Time_Completed_in_Production__c</field>
        <formula>Now()</formula>
        <name>CB_Request_DateTime_Completed_in_Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CB_Request_DateTime_Completed_in_Trainin</fullName>
        <description>Set &apos;Request: Date/Time Completed in Training&apos; to Now() when Completed in Trainingis checked.</description>
        <field>Date_Time_Completed_in_Training__c</field>
        <formula>Now ()</formula>
        <name>CB_Request_DateTime_Completed_in_Trainin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_BDC_ChangeClassification_Routine</fullName>
        <field>Change_Classification__c</field>
        <literalValue>Routine</literalValue>
        <name>DS_BDC_ChangeClassification_Routine</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_BDC_ClosingCaseComments</fullName>
        <field>Closing_Case_Comments__c</field>
        <formula>&quot;This Request has been Approved by the Approver&quot;</formula>
        <name>DS_BDC_ClosingCaseComments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_BDC_ClosingCaseComments_Reject</fullName>
        <field>Closing_Case_Comments__c</field>
        <formula>&quot;This Request has been Rejected by the Approver.&quot;</formula>
        <name>DS_BDC_ClosingCaseComments_Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_BDC_SFConfigNeeded_Uncheck</fullName>
        <field>SF_Config_Needed__c</field>
        <literalValue>0</literalValue>
        <name>DS_BDC_SFConfigNeeded_Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_BDC_Status_Closed</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>DS_BDC_Status_Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_IT_AssignedDevGroup_IfNull</fullName>
        <field>Assigned_Dev_Group__c</field>
        <literalValue>Hanson</literalValue>
        <name>DS_IT_AssignedDevGroup_IfNull</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_Request_OppStatus</fullName>
        <field>Opportunity_Status__c</field>
        <formula>IF(
ISPICKVAL(Status__c, &quot;Opportunity - Closed Lost&quot;),
&quot;Closed Lost&quot;,
IF(
OR(
ISPICKVAL(Status__c, &quot;Opportunity - In Discussion&quot;),
ISPICKVAL(Status__c, &quot;Opportunity - Discovery&quot;),
ISPICKVAL(Status__c, &quot;Opportunity - Qualification&quot;),
ISPICKVAL(Status__c, &quot;Opportunity - Proposal&quot;)
),
&quot;Open&quot;,
&quot;Closed Won&quot;
)
)</formula>
        <name>DS_Request_OppStatus</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_Request_RecordType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>SalesForce_Project</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>DS_Request_RecordType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_Request_Status</fullName>
        <field>Status__c</field>
        <literalValue>New - Under Review</literalValue>
        <name>DS_Request_Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upd_Administrators_Involved</fullName>
        <field>Adminstrators_Involved__c</field>
        <formula>IF(
  OR(NOT(CONTAINS(Adminstrators_Involved__c, $User.FirstName &amp; &quot; &quot; &amp; $User.LastName)),ISBLANK(Adminstrators_Involved__c)), 
  IF(
    NOT(ISBLANK(Adminstrators_Involved__c)), 
    Adminstrators_Involved__c &amp; &quot;, &quot;, 
    &quot;&quot;) 
  &amp; $User.FirstName &amp; &quot; &quot; &amp; $User.LastName, 
  Adminstrators_Involved__c
)</formula>
        <name>Upd - Administrator(s) Involved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upd_Cobalt_Admin_Field</fullName>
        <field>Cobalt_Admin__c</field>
        <literalValue>1</literalValue>
        <name>Upd - Cobalt Admin Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upd_Cobalt_Admin_Field_Uncheck</fullName>
        <description>Uncheck Upd - Cobalt Admin Field</description>
        <field>Cobalt_Admin__c</field>
        <literalValue>0</literalValue>
        <name>Upd - Cobalt Admin Field Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CB_REQUEST_UPD_Owner</fullName>
        <actions>
            <name>CB_REQUEST_UPD_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Priority__c</field>
            <operation>equals</operation>
            <value>Standard,Critical,High,Mass Hysteria!</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>DocuSign Anysigner New User</value>
        </criteriaItems>
        <description>When Request case requested auto assign to Request Queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CB_Request_DateTimeClosed</fullName>
        <actions>
            <name>CB_Request_DateTimeClosed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <description>Set &apos;Request: Date/Time Closed&apos; to Now() when Status change to &apos;Completed&apos;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CB_Request_DateTimeClosed2</fullName>
        <actions>
            <name>CB_Request_DateTimeClosed_Clear</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <description>Set &apos;Request: Date/Time Closed&apos; to Null when Status change not equal to &apos;Completed&apos;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CB_Request_DateTime_Completed_in_FullDev</fullName>
        <actions>
            <name>CB_Request_DateTime_Completed_in_FullDev</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Completed_in_FullDev__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CB_Request_DateTime_Completed_in_Production</fullName>
        <actions>
            <name>CB_Request_DateTime_Completed_in_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Completed_in_Prod__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <description>Set &apos;Request: Date/Time Completed in Production&apos; to Now() when Completed in Production is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CB_Request_DateTime_Completed_in_Training</fullName>
        <actions>
            <name>CB_Request_DateTime_Completed_in_Trainin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set &apos;Request: Date/Time Completed in Training&apos; to Now() when Completed in Trainingis checked.</description>
        <formula>AND(  Completed_in_Training__c = TRUE,  ISBLANK( Date_Time_Completed_in_Training__c ), NOT(BEGINS($User.Username,&quot;integration_user@adp.com&quot;)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Changes are in Training</fullName>
        <actions>
            <name>Send_notification_that_changes_are_in_training_from_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Changes_are_in_Training__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Email workflow triggered when the Send Notification that changes are in training checkbox is checked on the Request.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DS_BDC_UPD_SFConfigNeeded_ChangeClass</fullName>
        <actions>
            <name>DS_BDC_ChangeClassification_Routine</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>DS_BDC_SFConfigNeeded_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>DocuSign Anysigner New User</value>
        </criteriaItems>
        <description>Uncheck Assigned Config and set Change Classification to Routine for Record Type DocuSign Anysigner New User</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DS_IT_Rqst_DefAsgnDevGrp</fullName>
        <actions>
            <name>DS_IT_AssignedDevGroup_IfNull</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Default Assigned Dev Group (if not set but config/dev/be has sys admin profile</description>
        <formula>ISBLANK( TEXT(Assigned_Dev_Group__c)) &amp;&amp;    
RecordType.DeveloperName = &quot;SalesForce_Project&quot; &amp;&amp;
OR(NOT(CONTAINS(TEXT(Status__c), &quot;Cancelled - BU Declined&quot;)),NOT(CONTAINS(TEXT(Status__c), &quot;Cancelled - Not Approved&quot;))) &amp;&amp;
NOT(CONTAINS(TEXT(Status__c), &quot;Closed&quot;)) &amp;&amp;
( 
(NOT(ISBLANK( Assigned_Config__c )) &amp;&amp;
CONTAINS(Assigned_Config__r.Profile.Name, &quot;System Administrator&quot;)) ||
(NOT(ISBLANK( Assigned_SF_Dev__c )) &amp;&amp;
CONTAINS(Assigned_SF_Dev__r.Profile.Name, &quot;System Administrator&quot;)) ||
(NOT(ISBLANK( Assigned_SF_BA__c )) &amp;&amp; 
CONTAINS(Assigned_SF_BA__r.Profile.Name, &quot;System Administrator&quot;)) ||
(NOT(ISBLANK( Assigned_External_Dev__c )) &amp;&amp;   
CONTAINS (Assigned_External_Dev__r.Profile.Name, &quot;System Administrator&quot;)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DS_Request_UPD_OppStatus</fullName>
        <actions>
            <name>DS_Request_OppStatus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates opportunity status based on status</description>
        <formula>AND(ISCHANGED(Status__c), RecordType.Name=&quot;Salesforce Project Opportunity&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DS_Request_UPD_RecordType</fullName>
        <actions>
            <name>DS_Request_RecordType</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>DS_Request_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Opportunity - Closed Won</value>
        </criteriaItems>
        <description>Updates record type to SalesForce Project when request status is set to Opportunity - Closed Won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DS_SlsOps_EML_eFaxAccountChanges</fullName>
        <actions>
            <name>DS_SlsOps_eFaxAccountChanges</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Request__c.Region_or_Mgr_Chg_or_Lving_Sales__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Added per RQ-02833 for eFax Account Changes as identified in SalesForce.com</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IT Request Data Type Chgs</fullName>
        <actions>
            <name>IT_Request_ColumnTypeChg_Set</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>if checked send email</description>
        <formula>ISCHANGED( Includes_Field_Data_Type_Changes__c ) &amp;&amp;
 Includes_Field_Data_Type_Changes__c = True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Request Notification</fullName>
        <actions>
            <name>New_Request_Created_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>Notification to Sales Automation Admin team when a new Request is created.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Request Closed Notification</fullName>
        <actions>
            <name>Sales_Automation_Request_Completed_Notification_to_Creator</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>Notification to Request Creator when their Request has been marked as completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SalesAuto_Request_Alrt_Critical_4Hrs</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Request__c.Priority__c</field>
            <operation>equals</operation>
            <value>Critical</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>New - Under Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>When a Request object record is created w/ Priority of Critical it sends an email notification to the Sales Automation Admins. If no change after 4 hours it sends another notification to the admins.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_Critical_4Hours_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>SalesAuto_Request_Alrt_High_12Hrs</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Request__c.Priority__c</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>New - Under Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>When a Request object record is created w/ Priority of High it sends an email notification to the Sales Automation Admins. If no change after 12 hours it sends another notification to the admins.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_High_12Hours_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>12</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>SalesAuto_Request_Alrt_Mass_Hysteria</fullName>
        <actions>
            <name>SalesAuto_Request_Alrt_Mass_Hysteria</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Priority__c</field>
            <operation>equals</operation>
            <value>Mass Hysteria!</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>New - Under Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>When a Request object record is created w/ Priority of Mass Hysteria it sends an email notification to the Sales Automation Admins. If no change after 1 hour it sends another notification to the admins.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_Mass_Hysteria_1_hour_no_activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>SalesAuto_Request_Alrt_No_Activity</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.OwnerId</field>
            <operation>equals</operation>
            <value>Request Queue</value>
        </criteriaItems>
        <description>When a Request object case is created and there is no activity (Request Queue is Owner ) it sends notification to Sales Automation Admins</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_2_Hours_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_4_Hours_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_1_Day_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>SalesAuto_Request_Alrt_Std_24Hrs</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Request__c.Priority__c</field>
            <operation>equals</operation>
            <value>Standard</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.Status__c</field>
            <operation>equals</operation>
            <value>New - Under Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notContain</operation>
            <value>integration_user@adp.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Project</value>
        </criteriaItems>
        <description>When a Request object record is created w/ Priority of Std it sends an email notification to the Sales Automation Admins. If no change after 24 hours it sends another notification to the admins.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SalesAuto_Request_Alrt_Std_24Hours_No_Activity</name>
                <type>Alert</type>
            </actions>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Upd - Administrator%28s%29 Involved</fullName>
        <actions>
            <name>Upd_Administrators_Involved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Field Update - If the current User is an &quot;ADPDS - Admin&quot;, their name is logged to the Administrators Involved field on Request.</description>
        <formula>CONTAINS(UPPER($Profile.Name), &quot;ADPDS - ADMIN&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Upd - Cobalt Admin Field</fullName>
        <actions>
            <name>Upd_Cobalt_Admin_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update Cobalt Admin field to True if &apos;User_Groups_Impacted__c&apos; has &apos;CB - Sales&apos; and &apos;CB - Service&apos; and &apos;CB - Mktg&apos;</description>
        <formula>IF ( INCLUDES ( User_Groups_Impacted__c , &quot;CB - Sales&quot;), True, false) || IF ( INCLUDES ( User_Groups_Impacted__c , &quot;CB - Service&quot;), True, false) || IF ( INCLUDES ( User_Groups_Impacted__c , &quot;CB - Mktg&quot;), True, false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Upd - Cobalt Admin Field Uncheck</fullName>
        <actions>
            <name>Upd_Cobalt_Admin_Field_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update Cobalt Admin field to Faslse if &apos;User_Groups_Impacted__c&apos; not have &apos;CB - Sales&apos; and &apos;CB - Service&apos;.</description>
        <formula>IF ( NOT(INCLUDES ( User_Groups_Impacted__c, &quot;CB - Sales&quot;)), True, false)  &amp;&amp;  IF ( NOT(INCLUDES ( User_Groups_Impacted__c , &quot;CB - Service&quot;)), True, false)  &amp;&amp;  IF ( NOT(INCLUDES ( User_Groups_Impacted__c , &quot;CB - Mktg&quot;)), True, false) || NOT(BEGINS($User.Username,&quot;integration_user@adp.com&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
