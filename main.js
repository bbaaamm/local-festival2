var orgBColor = '#ffffff';
var orgTColor = '#000000';
function HighLightTD(target, backColor,textColor) {
var tbody = target.parentNode;
var tds = tbody.getElementsByTagName('td');
for ( var i = 0; i < tds.length; i++ ) {
if ( tds[i] != target ) {
tds[i].style.backgroundColor = orgBColor;
tds[i].style.color = orgTColor;
} else {
tds[i].style.backgroundColor = backColor;
tds[i].style.color = textColor;
    }
  }
}