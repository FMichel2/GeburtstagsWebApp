$( function() {
  $( "#datepicker_von" ).datepicker({
                                    changeMonth: true,
                                    changeYear: false,
                                    dateFormat: 'dd/mm'
                                    
                                    });
  } );
$( function() {
  $( "#datepicker_bis" ).datepicker({
                                    changeMonth: true,
                                    changeYear: false,
                                    dateFormat: 'dd/mm'
                                    });
  } );


function getPersonen() {
    deleteTable();
    var date_from = document.getElementById('datepicker_von').value;
    
    var parts =date_from.split('/');
    
    var mydate_from = new Date(2000,parseInt(parts[1]-1),parseInt(parts[0]));
    
    var date_to = document.getElementById('datepicker_bis').value;
    var parts1 =date_to.split('/');
    //please put attention to the month (parts[0]), Javascript counts months from 0:
    // January - 0, February - 1, etc
    var mydate_to = new Date(2000,parseInt(parts1[1]-1),parseInt(parts1[0]));
    
    if(date_from != "" && date_from !=""){
        var xmlhttp, myObj, x, y, txt = "";
        
        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                
                for (x in myObj) {
                    
                    var dateCheck = new Date(2000,parseInt(myObj[x].gebMonat-1),parseInt(myObj[x].gebTag));
                    if(dateCheck.getTime() >= mydate_from.getTime() && dateCheck.getTime() <= mydate_to.getTime()){
                        fillTable(myObj[x].name,myObj[x].gebTag +"."+myObj[x].gebMonat+" "+myObj[x].gebJahr);
                    }
                }
            }
        };
        xmlhttp.open("GET", "http://localhost:8080/api/personen", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send();
    }
}


function setPersonen() {
    var form = document.forms.namedItem("fileinfo");
    var oData = new FormData(form);
    var x = new XMLHttpRequest();
    x.open( "POST", "http://localhost:8080/api/personen");
    x.send(oData);
}



function fillTable(name, date) {
    
    var table = document.getElementById("tablePersonen");
    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    cell1.innerHTML = name;
    cell2.innerHTML = date;
    
}

function deleteTable(){
    
    
    var tableHeaderRowCount = 1;
    var table = document.getElementById('tablePersonen');
    var rowCount = table.rows.length;
    for (var i = tableHeaderRowCount; i < rowCount; i++) {
        table.deleteRow(tableHeaderRowCount);
    }
}


