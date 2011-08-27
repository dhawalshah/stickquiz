window.onload = display;

var milisec= 0; 
var seconds= document.getElementById('timerText').innerHTML;
 
function display(){ 
 if (milisec<=0){ 
    milisec=9; 
    seconds-=1; 
 } 
 if (seconds<=-1){ 
    milisec=0; 
    seconds+=1;
    submitTags();
 } 
 else 
    milisec-=1;
     
 document.getElementById('timerText').innerHTML= seconds+"."+milisec ;
 setTimeout("display()",100); 
}; 

function submitTags()
{
  var btnSubmitTags = document.getElementById('timerSubmit');
  // Programmatically click the submit button
  btnSubmitTags.click();
};