
// setTimeout(changeView('hello'), 1000);

function connectWebViewJavascriptBridge(callback) {
    if (window.bridge) {
        callback(window.bridge)
    } else {
        document.addEventListener('JSBridgeReady', function() {
                                  callback(window.bridge)
                                  }, false)
    }
}

function changeView (str) {
    element= document.getElementById("test")
    element.innerHTML = str;
    element.style.color = "black"
    element.style.background = "#ffffff"
}

function btnClick(){
    
    connectWebViewJavascriptBridge(function(bridge){
                                bridge.aaa("hello")
                                   });
//    document.write("<h1>a</h1>")
}
