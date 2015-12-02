// check to see if no conflict mode is already set. if not, set it
var j$; if(!j$) { j$ = jQuery.noConflict(); } 

// top-level variables
var loadingurl; 

// initialize when the document is ready for viewing
j$(document).ready(InitializePage);

function InitializePage()
{    
    //Visualforce.remoting.timeout = VFRemotingTimeout;
    loadingurl = "url("+__InputBoxLoadingIcon+")";
    console.log(loadingurl);
    // hide the Find Source section if the sType and sId are provided 
    if(__sType && __sId) { j$("[id$='FindSource'] img").click(); }      
    
    
}

function CloseSelected()
{
  MessageBox("Warning", "This will also CLOSE the Case(s) along with Updating comments. "
        + "Do you wish to Continue? " , 
        {"Continue":function(){ProcessSelectedRows("Close");jQuery(this).dialog("close");},"Cancel":function(){jQuery(this).dialog("close");}}); 
}

function UpdateSelected()
{
  MessageBox("Warning", "This will ONLY Update Case comments. "
        + "Do you wish to Continue? " , 
        {"Continue":function(){ProcessSelectedRows("Update");jQuery(this).dialog("close");},"Cancel":function(){jQuery(this).dialog("close");}});  
}


function ProcessSelectedRows(SourceEvent)
{
    var CloseToIds = [];    
    //get comments column value
    var CloseComments = j$("[id$='InputComment']").val();    
    if(CloseComments != "") {
        // selected items exists in the data table component included on the page
        j$(SelectedItems).each( function(i,v) { CloseToIds.push(v.Id); } );
        
        if (CloseToIds!="") {            
            var CloseParameters = {Comments:CloseComments, CloseIds:CloseToIds, SelectedEvent:SourceEvent};
            console.log(CloseParameters);
            var MessageBoxHeading = "Updating ....";
            var MessageBoxDesc = "Updating Selected records. <br/>Please wait...";
            
            if (SourceEvent=="Close")
            {
                MessageBoxDesc ="Closing Selected records. <br/>Please wait...";
                MessageBoxHeading = "Closing ....";
            } 
            //display processing dialog msg
            var msg = j$("<div>")
            .addClass("processing-message")
            .append(j$("<div>").html(MessageBoxDesc))
            .append(j$("<img>").attr("src",__ProcessingBarLoadingIcon)); 
            var wait = MessageBox(MessageBoxHeading, msg);
            
            DSCB_CloseAnything.CloseToSelected(CloseParameters, function(returned, event){
                //refresh datatable contents, if any  
                if(j$("#ErrorRecordsContainer table thead tr th").length > 0) {
                    var tables = j$('#ErrorRecordsTable').DataTable();
                    tables.fnClearTable();                   
                }  
                
                
                var ResultMsg = j$("#ResultMsg").html(returned.Message);   
                console.log(ResultMsg);
                
                
                if(returned.Success != true) {
                    var ErrorRecordsContainer = j$("#ErrorRecordsContainer");
                    ErrorRecordsContainer.css("display","block");
                    var ErrorRecordsTable = j$("#ErrorRecordsTable", ErrorRecordsContainer); 
                    
                    // set column headers and initialize table
                    if(j$("#ErrorRecordsContainer table thead tr th").length < 1)
                    {                    
                        InitializeErrorResultsTable(ErrorRecordsTable);
                        console.log(ErrorRecordsTable);
                    }
                    
                    // add error records
                    j$(returned.Results).each(function(i, result) { //log(result);
                        var row = CreateRow(result.Record, result.ErrorMessage);
                        j$("#ErrorRecordsTable").dataTable().fnAddData(row);
                    });               
                } else {
                    window.location=window.location;
                }
                wait.dialog("close");
            });
        } else {
            MessageBox("Invalid Selection","Please select atlease one Case to process.")
        }            
    }
    else
    {        
        MessageBox("Invalid Comments","Please enter Comments before processing.")		       
    } 
    
}

function Cancel()
{
    var SearchString = window.location.search.substring(1);
    var VariableArray = SearchString.split('&');
    for(var i = 0; i < VariableArray.length; i++){
        var KeyValuePair = VariableArray[i].split('=');
        if(KeyValuePair[0] == 'sourceid')
        {                      
            window.location.assign('/' + KeyValuePair[1]);
        }
    } 
}

function MessageBox(t, m, b)
{ 
    var mb = j$("<div>"); 
    if (m) { mb.html(m); } else { mb.html("Processing..."); }
    
    mb.dialog({
        modal: true,
        autoOpen: false,
        title: (t?t:"Please Wait..."),
        buttons: (b?b:{})
    });
    
    mb.dialog("open");
    
    return mb;
}

function InitializeErrorResultsTable(ErrorRecordsTable) 
{
    var ColumnDefinitions = [];
    var ErrorRecordsTableHeaderRow = j$("<tr>");
    ErrorRecordsTableHeaderRow.append(
        j$("<th>")
        .html("CaseNumber")
        .attr("id", "Caseid"));
    ColumnDefinitions.push({"sType": "string", "aTargets": [1]});
    
    ErrorRecordsTableHeaderRow.append(
        j$("<th>")
        .html("Error")
        .attr("id", "ErrorMsg"));
    
    ErrorRecordsTable.append(j$("<thead>").append(ErrorRecordsTableHeaderRow));
    ColumnDefinitions.push({"sType": "string", "aTargets": [1]});
    
    // if there is no table body, add one
    var ErrorRecordsTableBody = j$("tbody", ErrorRecordsTable);
    if(ErrorRecordsTableBody.length < 1) { ErrorRecordsTable.append(j$("<tbody>")); }
    
    ErrorRecordsTable.addClass("display datatable");
    
    ErrorRecordsTable.dataTable({   
        "bJQueryUI": true,
        "bPaginate": false,
        //"iDisplayLength": 100, 
        //"sPaginationType": "full_numbers",
        "fnCreatedRow": function( nRow, aData, iDataIndex ) { 
            if(aData.length && aData[aData.length-1] && aData[aData.length-1].rowid) { // when a row is created 
                j$(nRow).attr("id", aData[aData.length-1].rowid); } // set the id to the first data element
        },
        "aoColumnDefs": ColumnDefinitions,
        "bRetrieve": true,
        "bFilter": false
    });
    
    
}

function CreateRow(record,Message){
    var row = [];
    var Caseidcell = record["CaseNumber"] ? record["CaseNumber"] : "";
    
    var anchor = j$("<a>");
    anchor.html(Caseidcell);
    anchor.attr("target","_blank");
    anchor.attr("href", "/" + record.Id);
    Caseidcell = anchor.clone().wrap("<p>").parent().html(); 
    row.push(Caseidcell);    
    
    var CaseErrorcell = Message ? Message : "";
    row.push(CaseErrorcell);    
    return row;
}