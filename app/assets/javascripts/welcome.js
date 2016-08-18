	var w = "Welcome!";
	alert(w);
	var a = "Oh!";
	console.log(a)

	var ob = {
		pole: "енергія",
		kvant: 'hv',
		f: function (a) {
			console.log(this.pole+a+this.kvant)
		}
	};
	ob.f(" квантується, E=");
