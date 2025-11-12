var adblock=new Array()
adblock[0]='<a href="http://www.jupitermedia.com/"><img src="http://www.jupitermedia.com/img/onlineMedia.jpg" class="imgBorder" alt="Jupitermedia"></a>'
adblock[1]='<a href="http://www.earthweb.com/"><img src="http://www.jupiterweb.com/img/erthweb-micro.gif" class="imgBorder" alt="Earthweb"></a>'
adblock[2]='<a href="http://www.internet.com/"><img src="http://www.jupiterweb.com/img/icom.gif" class="imgBorder" alt="internet.com"></a>'
adblock[3]='<a href="http://www.devx.com/"><img src="http://www.jupiterweb.com/img/devx-micro.gif" class="imgBorder" alt="DevX.com"></a>'
adblock[4]='<a href="http://www.graphics.com/"><img src="http://www.jupiterweb.com/img/graphicscom-micro.gif" class="imgBorder" alt="Graphics.com"></a>'
adblock[5]='<a href="http://www.jupiterwebcasts.com/"><img src="http://www.jupiterwebcasts.com/img/rd06/jwebcasts_logo.gif" width="165" height="22" class="imgBorder" alt="Jupiter Webcasts"></a>'
adblock[6]='<a href="http://www.webreference.com/"><img src="http://www.webreference.com/art/webref.gif" class="imgBorder" alt="Web Reference"></a>'
adblock[7]='<a href="http://webdeveloper.com/"><img src="http://www.webdeveloper.com/forum/images/webdev-logo2.gif" class="imgBorder" alt="Web Developer"></a>'
adblock[8]='<a href="http://www.scriptsearch.com/"><img src="http://www.scriptsearch.com/img/logo.gif" class="imgBorder" alt="Script Search"></a>'
adblock[9]='<a href="http://www.databasejournal.com/"><img src="http://www.databasejournal.com/img/logo.gif" width="153" height="55" class="imgBorder" alt="Database Journal"></a>'
adblock[10]='<a href="http://www.flashkit.com/"><img src="http://images2.flashkit.com/images/fk_logotop.gif" class="imgBorder"  alt="FlashKit"></a>'
adblock[11]='<a href="http://www.hiermenuscentral.com/"><img src="http://www.hiermenuscentral.com/img/hr-logo.gif" class="imgBorder" alt="HierMenus Central"></a>'
adblock[12]='<a href="http://www.4guysfromrolla.com/"><img src="http://www.4guysfromrolla.com/img/4guyslogo.gif" class="imgBorder" width="202" height="43" alt="4 Guys from Rolla"></a>'
adblock[13]='<a href="http://www.asp101.com/"><img src="http://www.asp101.com/img/asp_asp101_logo.gif" class="imgBorder" alt="ASP 101"></a>'


function randomorder(targetarray, spacing) {
  var randomorder=new Array()
  var the_one
  var z=11
  for (i=0;i<targetarray.length;i++)
  randomorder[i]=i

  while (z<targetarray.length) {
    the_one=Math.floor(Math.random()*targetarray.length)
    if (targetarray[the_one]!="_selected!"){
      document.write(targetarray[the_one]+spacing)
      targetarray[the_one]="_selected!"
      z++
    }
  }
}
