var btn = document.querySelectorAll(".myNewsBtn");
var view = document.querySelectorAll(".myNewsView");
var ch = document.getElementsByName("choose");
var allC = document.getElementsByName("allChecked")[0];
var detBtn = document.querySelectorAll(".personalFoor-btn")[0];

view[0].style.display = "block";
 btn[0].style.borderBottom = "3px solid #FD7E24";
for(let i = 0; i < btn.length; i ++) {
  btn[i].index = i;
  btn[i].onclick = function() {
    for(var i = 0; i < btn.length; i ++) {
      view[i].style.display = "none";
      btn[i].style.borderBottom = "none";
    }
    view[this.index].style.display = "block";
    btn[this.index].style.borderBottom = "3px solid #FD7E24";
  }
};

function doCheck() {
    if(allC.checked == true) {
      for(var i = 0;i < ch.length; i++) {
        ch[i].checked = true;
      }
      detBtn.style.backgroundColor = "#e67c0a"
    } else {
      for(var i = 0;i < ch.length; i++) {
        ch[i].checked = false;
      }
      detBtn.style.backgroundColor = "#fd7e24"
    }
}


  $("input[name='choose']").click(function() {
      $("input[name='choose']").each(function(index) {
        console.log(index)
        if($("input[name='choose']")[index].checked == true) {
          detBtn.style.backgroundColor = "#e67c0a"
          return false;
        } else {
          detBtn.style.backgroundColor = "#fd7e24"
        }
      })
  });
