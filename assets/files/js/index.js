document.write("<script language=javascript src='js/client.js'></script>");



var button1 = document.getElementById('button1');
button1.addEventListener('click',function () {
                         
                         buttonClick1();
                         });

document.getElementById('button2').addEventListener('click',function () {
                                                    buttonClick2();
                                                    });



function showAler(data) {
    alert(data);
    return data+'收到'
    //    iosWeixinPay();
}
function showAler2() {
    alert(4);
    //    iosWeixinPay();

}



// js调oc 原生注入方式
function buttonClick1() {
    
    var person = new Person();
    person.name = 'jim';
    person.age = 12;
    person.isAll = true;
    if (isiOS) {
        
        window.webkit.messageHandlers.person.postMessage(person);
    }else{
        
        
    }
    
}

function buttonClick2() {
    
    if(isiOS){
      alert("ios平台");
    }else{
        alert("其他平台");
    }
    
}

function buttonClick() {
    //    parameter 是参数,
    //ocTestName oc 需要js注入的名称
    alert("A");
    window.webkit.messageHandlers.ocTestName.postMessage('jim');
    
}

function Toast() {

    return "jim";
}

//全局变量
var globalPerson = new Person() //用一个构造函数来创建了对象


// 定义对象
function Person(name, age,isAll) { //创建一个person的函数
    this.name = name; //此处的this对应的是对象obj
    this.age = age
    this.isAll = isAll
}


function payCallBack(data) {
    
    alert(data);
    
}

function iosWeixinPay() {
    
    globalPerson.name = 'tom'
    globalPerson.age = 12
    
    
    
}



