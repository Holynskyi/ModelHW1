$(function(){
	// var doc = document;

	// var w = "Welcome!";
	// //alert(w);
	// var a = "Oh!";
	// console.log(a);

	// var ob = {
	// 	pole: "енергія",
	// 	kvant: 'hv',
	// 	f: function (a) {
	// 		console.log(this.pole+a+this.kvant)
	// 	}
	// };
	// ob.f(" квантується, E=");

	// //var des = window.confirm('бути чи не бути?');
	// //alert(des ? "бути" : "не бути");

	// var elem = doc.getElementsByTagName('h1');
	// var newElem = doc.createElement("h3");
	// newElem.innerHTML = '<b>сутність</b>';

	// motherElem = doc.getElementsByClassName('jumbotron');
	// motherElem[0].insertBefore(newElem,elem[0]);
	//console.log (motherElem);

	//st = elem[0].style
	//st.color = "red";

	//var timer = setTimeout(function(){console.log(w)},2000);
	//clearTimeout(timer);

/*function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
  }*/

	t=0;
	v=17.9;
	g=0.1;
	elem = document.getElementById("circle");

  jumping = function(){
		elem.style.height = 100 + 'px';
		x = v*t - g*t*t;

		if (x<0){
			x = 0;
			elem.style.height = 60 + 'px' ;
			elem.style["background-color"] = "red";
			v*=0.9;
			t=0; 
		}
		
		if ((t>=v/(2*g))&&(t<v/(2*g)+10)){
			elem.style["background-color"] = "blue";
		}

		elem.style.top = 800-x +"px";
		console.log (elem.style.top+", x="+x+", t="+t);
		t++;
		if (v>0.5){
			setTimeout (jumping,15);	
		}
  }

	jumping();

	elem.onclick = function () {
		this.style.backgroundColor = "green";
	}

	wel = document.getElementsByTagName("h1")[0];
	wel.addEventListener ("click", function(){alert("Hi!");},false);
	wel.addEventListener ("click", function(){console.log("Hi!");},false);



}); // END DOC READY