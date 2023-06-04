/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

state=0;//설문지 삭제하기 클릭 상태 0 : 삭제하기 진행 X, 1:삭제하기 진행 0
function delServey(num){
    if(state === 0){
        num.forEach((number) =>{
            document.getElementById(`${number}`).style.display="block";
            console.log(document.getElementById(`${number}`));
            
        });
    }else if(state === 1){
        
    }
}
