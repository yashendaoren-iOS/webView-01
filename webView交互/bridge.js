(function() {
  if (window.bridge) { return }
  var messagingIframe
  
  var messageHandlers = {}
  
  var nineteenLou = 'www.19lou.com'
  
  function _createQueueReadyIframe() {
      messagingIframe = document.createElement('iframe')
      messagingIframe.style.display = 'none'
      document.documentElement.appendChild(messagingIframe)
  }
  
  
  function aaa(str) {
//    alert("str")
    messagingIframe.src = nineteenLou + '://' + str
  }
  
  window.bridge = {
  
    aaa:aaa,
  
  }
  
  _createQueueReadyIframe()
  
  var readyEvent = document.createEvent('Events')
  readyEvent.initEvent('JSBridgeReady')
  readyEvent.bridge = bridge
  document.dispatchEvent(readyEvent)

})();
