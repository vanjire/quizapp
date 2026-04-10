function create(){
    let form=document.getElementById('frm');
    let co=document.getElementById('count').value;
    document.getElementById('numberq').style.display="none"
    for(let i=0;i<co;i++){
         let ro=document.createElement('div');
             ro.setAttribute('class','zx')
       
         let ind=document.createElement('div');
        ind.setAttribute('class','px')
        ind.innerHTML='Question'+(i+1);
        form.appendChild(ind)
       
        
       
        let e=document.createElement('input');
        e.setAttribute("type","text");
        e.setAttribute("name","question");
        e.setAttribute("placeholder","enter question");

        let option1=document.createElement('input');
        option1.setAttribute("type","text");
        option1.setAttribute("name","option1");
        option1.setAttribute("placeholder","enter option1");
        let option2=document.createElement('input');
        option2.setAttribute("type","text");
        option2.setAttribute("name","option2");
        option2.setAttribute("placeholder","enter option2");

        let option3=document.createElement('input');
        option3.setAttribute("type","text");
        option3.setAttribute("name","option3");
        option3.setAttribute("placeholder","enter option3");
        let option4=document.createElement('input');
        option4.setAttribute("type","text");
        option4.setAttribute("name","option4");
        option4.setAttribute("placeholder","enter option4");
        
        let correct=document.createElement('input');
        correct.setAttribute("type","number");
        correct.setAttribute("name","correctOption");
        correct.setAttribute("placeholder","enter correct option");
        ro.appendChild(e)
         ro.appendChild(option1)
          ro.appendChild(option2)
           ro.appendChild(option3)
            ro.appendChild(option4)
            ro.appendChild(correct)
            form.appendChild(ro)
            
    }
}