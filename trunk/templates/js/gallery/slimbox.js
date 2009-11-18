/*
	Slimbox v1.65 - The ultimate lightweight Lightbox clone
	(c) 2007-2008 Christophe Beyls <http://www.digitalia.be>
	MIT-style license.
*/
var Slimbox;(function(){var g=0,f,l,b,s,t,o,e,m,j=new Image(),k=new Image(),x,A,p,h,w,z,i,y,c;window.addEvent("domready",function(){$(document.body).adopt($$([x=new Element("div",{id:"lbOverlay"}).addEvent("click",n),A=new Element("div",{id:"lbCenter"}),z=new Element("div",{id:"lbBottomContainer"})]).setStyle("display","none"));p=new Element("div",{id:"lbImage"}).injectInside(A).adopt(h=new Element("a",{id:"lbPrevLink",href:"#"}).addEvent("click",d),w=new Element("a",{id:"lbNextLink",href:"#"}).addEvent("click",r));i=new Element("div",{id:"lbBottom"}).injectInside(z).adopt(new Element("a",{id:"lbCloseLink",href:"#"}).addEvent("click",n),y=new Element("div",{id:"lbCaption"}),c=new Element("div",{id:"lbNumber"}),new Element("div",{styles:{clear:"both"}}));e={overlay:new Fx.Tween(x,{property:"opacity",duration:500}).set(0),image:new Fx.Tween(p,{property:"opacity",duration:500,onComplete:a}),bottom:new Fx.Tween(i,{property:"margin-top",duration:400})}});Slimbox={open:function(E,D,C){f=$extend({loop:false,overlayOpacity:0.8,resizeDuration:400,resizeTransition:false,initialWidth:250,initialHeight:250,animateCaption:true,showCounter:true,counterText:"Image {x} of {y}"},C||{});if(typeof E=="string"){E=[[E,D]];D=0}l=E;f.loop=f.loop&&(l.length>1);B();q(true);o=window.getScrollTop()+(window.getHeight()/15);e.resize=new Fx.Morph(A,$extend({duration:f.resizeDuration,onComplete:a},f.resizeTransition?{transition:f.resizeTransition}:{}));A.setStyles({top:o,width:f.initialWidth,height:f.initialHeight,marginLeft:-(f.initialWidth/2),display:""});e.overlay.start(f.overlayOpacity);g=1;return u(D)}};Element.implement({slimbox:function(C,D){$$(this).slimbox(C,D);return this}});Elements.implement({slimbox:function(C,F,E){F=F||function(G){return[G.href,G.title]};E=E||function(){return true};var D=this;D.removeEvents("click").addEvent("click",function(){var G=D.filter(E,this);return Slimbox.open(G.map(F),G.indexOf(this),C)});return D}});function B(){x.setStyles({top:window.getScrollTop(),height:window.getHeight()})}function q(C){["object",Browser.Engine.trident?"select":"embed"].forEach(function(E){Array.forEach(document.getElementsByTagName(E),function(F){if(C){F._slimbox=F.style.visibility}F.style.visibility=C?"hidden":F._slimbox})});x.style.display=C?"":"none";var D=C?"addEvent":"removeEvent";window[D]("scroll",B)[D]("resize",B);document[D]("keydown",v)}function v(C){switch(C.code){case 27:case 88:case 67:n();break;case 37:case 80:d();break;case 39:case 78:r()}return false}function d(){return u(s)}function r(){return u(t)}function u(C){if((g==1)&&(C>=0)){g=2;b=C;s=((b||!f.loop)?b:l.length)-1;t=b+1;if(t==l.length){t=f.loop?0:-1}$$(h,w,p,z).setStyle("display","none");e.bottom.cancel().set(0);e.image.set(0);A.className="lbLoading";m=new Image();m.onload=a;m.src=l[C][0]}return false}function a(){switch(g++){case 2:A.className="";p.setStyles({backgroundImage:"url("+l[b][0]+")",display:""});$$(p,i).setStyle("width",m.width);$$(p,h,w).setStyle("height",m.height);y.set("html",l[b][1]||"");c.set("html",(f.showCounter&&(l.length>1))?f.counterText.replace(/{x}/,b+1).replace(/{y}/,l.length):"");if(s>=0){j.src=l[s][0]}if(t>=0){k.src=l[t][0]}if(A.clientHeight!=p.offsetHeight){e.resize.start({height:p.offsetHeight});break}g++;case 3:if(A.clientWidth!=p.offsetWidth){e.resize.start({width:p.offsetWidth,marginLeft:-p.offsetWidth/2});break}g++;case 4:z.setStyles({top:o+A.clientHeight,marginLeft:A.style.marginLeft,visibility:"hidden",display:""});e.image.start(1);break;case 5:if(s>=0){h.style.display=""}if(t>=0){w.style.display=""}if(f.animateCaption){e.bottom.set(-i.offsetHeight).start(0)}z.style.visibility="";g=1}}function n(){if(g){g=0;m.onload=$empty;for(var C in e){e[C].cancel()}$$(A,z).setStyle("display","none");e.overlay.chain(q).start(0)}return false}})();

// AUTOLOAD CODE BLOCK (MAY BE CHANGED OR REMOVED)
Slimbox.scanPage = function() {
	var links = $$("a").filter(function(el) {
		return el.rel && el.rel.test(/^lightbox/i);
	});
	$$(links).slimbox({/* Put custom options here */}, null, function(el) {
		return (this == el) || ((this.rel.length > 8) && (this.rel == el.rel));
	});
};
window.addEvent("domready", Slimbox.scanPage);


 var viewportwidth;
 var viewportheight;
 
 if (typeof window.innerWidth != 'undefined')
 {
	  // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
	  viewportwidth = window.innerWidth,
      viewportheight = window.innerHeight
 } else if (typeof document.documentElement != 'undefined'
      && typeof document.documentElement.clientWidth !=
      'undefined' && document.documentElement.clientWidth != 0)
 {
    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
    viewportwidth = document.documentElement.clientWidth,
    viewportheight = document.documentElement.clientHeight
 } else {
	// older versions of IE
    viewportwidth = document.getElementsByTagName('body')[0].clientWidth,
    viewportheight = document.getElementsByTagName('body')[0].clientHeight
 }
document.write('<p>Your viewport width is '+viewportwidth+'x'+viewportheight+'</p>');