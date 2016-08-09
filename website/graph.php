<?php
       

$conn = new mysqli($servername, $username, $password, $dbname);
if($conn->connect_error) {
die ("Connection Failed: " .$conn->connect_error);
}

?>

<a href='..'>Back to Homepage</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<!-- Additional files for the Highslide popup effect -->
<script src="https://www.highcharts.com/samples/static/highslide-full.min.js"></script>
<script src="https://www.highcharts.com/samples/static/highslide.config.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/samples/static/highslide.css" />
<link rel="stylesheet" type="text/css" href="css/sample.css">
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<script>
var champArray = [
<?php
	$sqlChamp = "SELECT * FROM champion ORDER BY cname";
	$resultChamp = mysqli_query($conn, $sqlChamp);
	if (mysqli_num_rows($resultChamp) > 0){
		while ($rowChamp = mysqli_fetch_assoc($resultChamp)) {
			$name=$rowChamp["cname"];
			echo"\"$name\",";
		}
	}
?>
];

var champName;
var urlChampName = "<?php echo $_GET['champ']; ?>";
console.log(urlChampName); 
//console.log(x);
/*var preSplit = x.split(";");
for(i=0;i<preSplit.length;i++){
    if(preSplit[i].indexOf('champ')> -1){
        champName = preSplit[i];
    }
}*/


//var splitString = champName.split('=');
//console.log(splitString);
/*
if(window.location.href.indexOf("?") === -1 && urlChampName !== ""){
		//window.location.href = "?champ=" + urlChampName;
	}

if(window.location.href.indexOf("?") > -1) {
		var newSplit = <?php $_GET['champ']; ?>;
        console.log(newSplit); 
		urlChampName = newSplit;
	}
*/

if (urlChampName.indexOf("%20") > -1){
    //console.log("found single quote");
    var z = urlChampName.split("%20");
    //console.log(y);
    z[0]=z[0].concat(' ');
    urlChampName = z[0].concat(z[1]);
}
if (urlChampName.indexOf("%27") > -1){
    //console.log("found single quote");
    var y = urlChampName.split("%27");
    //console.log(y);
    y[0]=y[0].concat('\'');
    urlChampName = y[0].concat(y[1]);
}


if(window.location.href.indexOf("?") === -1 && urlChampName === ""){
		window.location.href = "/404";
	}

if(urlChampName === ""){
		window.location.href = "/404";
	}
if(champArray.indexOf(urlChampName)=== -1){
		window.location.href = "/404";
	}




//document.cookie = "champ="
//console.log(urlChampName);

var patchArray = [
<?php
        $sql = "SELECT P.pname FROM patch P, rate R,champion C WHERE R.patch_id = P.id AND R.champion_id = C.id AND R.type_id = 1  AND C.cname = \"" . $_GET["champ"] . "\" ORDER by P.id";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
                while ($row = mysqli_fetch_assoc($result)) {
                        $name=$row["pname"];
                        echo"\"$name\",";
                }
        }
?>
];


$(function () {
    $('#container').highcharts({
        title: {
            text: urlChampName + ' Rates',
	    style:{
                fontSize: '30px'
            },
            x: -20 //center
        },
         scrollbar: {
	    enabled: 'true',
            barBackgroundColor: '#0f497b',
            barBorderRadius: 10,
            barBorderWidth: 3,
            buttonBackgroundColor: '#0f497b',
            buttonBorderWidth: 0,
            buttonArrowColor: 'white',
            buttonBorderRadius: 7,
            rifleColor: 'white',
            trackBackgroundColor: 'white',
            trackBorderWidth: 20,
            trackBorderRadius: 1,
	    height: 25
        },

        rangeSelector: {
            selected: 1
        },

        xAxis: {
	    title: {
                text: 'Patch Version',
                style:{
                        fontSize: '25px'
                }
            },
            categories: patchArray,
            labels:{
 	    	style:{
                	fontSize: '20px'
            	}
	    },

	    min: 0,
	    max: 10
        },
        yAxis: {
            title: {
                text: 'Rate (%)',
                style:{
                        fontSize: '25px'
                }
            },
	    alternateGridColor: '#eeeeee',
            labels:{
                style:{
                        fontSize: '20px'
                }
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },

        tooltip: {
		shared: true,
                valueSuffix: '%',
		footerFormat: 'Nerfs: '+this.x+'?, Buffs: ?, Neutral Changes: ?',
		style:{
                    fontSize: '17px'
                },
                formatter: function () {
               		var s = '<b>' + this.x + '</b>';
			var buffArray = [];
			var nerfArray = [];
			var neutralArray = [];
			var numBuffs = [];
			var numNerfs = [];
			var numNeutrals = [];
                	$.each(this.points, function () {

				buffArray = [
				<?php
        				$sql = "SELECT P.pname FROM patch_note PN, patch P, champion C WHERE PN.patch_id = P.id AND PN.champion_id = C.id AND (PN.type_id = 1 OR PN.type_id = 4 OR PN.type_id = 7) AND C.cname = \"" . $_GET["champ"] . "\"  ORDER by P.id";
        				$result = mysqli_query($conn, $sql);
        				if (mysqli_num_rows($result) > 0){
               					while ($row = mysqli_fetch_assoc($result)) {
                        				$name=$row["pname"];
                        				echo"\"$name\",";
                				}
        				}
				?>
				];


                                nerfArray = [
                                <?php
                                        $sql = "SELECT P.pname FROM patch_note PN, patch P, champion C WHERE PN.patch_id = P.id AND PN.champion_id = C.id AND (PN.type_id = 3 OR PN.type_id = 6 OR PN.type_id = 9) AND C.cname = \"" . $_GET["champ"] . "\"  ORDER by P.id";
                                        $result = mysqli_query($conn, $sql);
                                        if (mysqli_num_rows($result) > 0){
                                        	while ($row = mysqli_fetch_assoc($result)) {
                                                	$name=$row["pname"];
                                                	echo"\"$name\",";
                                        	}
                                	}
                                ?>
                                ];


                                neutralArray = [
                                <?php
                                        $sql = "SELECT P.pname FROM patch_note PN, patch P, champion C WHERE PN.patch_id = P.id AND PN.champion_id = C.id AND (PN.type_id = 2 OR PN.type_id = 5 OR PN.type_id = 8) AND C.cname = \"" . $_GET["champ"] . "\"  ORDER by P.id";
                                        $result = mysqli_query($conn, $sql);
                                        if (mysqli_num_rows($result) > 0){
                                        	while ($row = mysqli_fetch_assoc($result)) {
                                                	$name=$row["pname"];
                                                	echo"\"$name\",";
                                        	}
                                	}
                                ?>
                                ];


                    		s += '<br/>' + this.series.name + ': ' +
                        	this.y + '%';
                	});
			for(i=0;i<buffArray.length;i++){
				if(buffArray[i] === this.x){
					numBuffs.push(buffArray[i]);
				}
			}
			for(i=0;i<nerfArray.length;i++){
                                if(nerfArray[i] === this.x){
                                        numNerfs.push(nerfArray[i]);
                                }
                        }
			for(i=0;i<neutralArray.length;i++){
                                if(neutralArray[i] === this.x){
                                        numNeutrals.push(neutralArray[i]);
                                }
                        }
			s += "<br/>Buffs: " + numBuffs.length + " <br/>Nerfs: " + numNerfs.length + " <br/>Neutral changes: " + numNeutrals.length;
                	return s;
            	}
        },

	plotOptions: {
        	series: {
                    cursor: 'pointer',
                    point: {
                        events: {
			    click: function() {

				var textarea = document.getElementById("PatchNotes");
				var lineNum = -1;
				var lines = textarea.value.split("\n");
				for(var i = 1;i < lines.length;i++){
				        if(lines[i].includes(this.category)){
				                lineNum = i;
				        }
				}
				if(lineNum!=-1){
					textarea.scrollTop = (lineNum)*24;
				}
                            }
                        }
                    },
                    marker: {
                        lineWidth: 1
                    }
                }
	},


        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            itemStyle:{
                fontSize: '17px'
            },
            borderWidth: 0
        },
        series: [{
            name: 'Win-rate',
            data: [<?php
		$sql = "SELECT R.percentage FROM rate R, champion C Where type_id = 1 AND R.champion_id = C.id AND C.cname = \"" . $_GET["champ"] . "\" ORDER BY R.id";
		$result = mysqli_query($conn, $sql);
			if (mysqli_num_rows($result) > 0){
				while($row = mysqli_fetch_assoc($result)){
					$name=$row["percentage"];
					echo"$name,";
				}
			}
			?>
	]
        },{
            name: 'Pick-rate',
	    color: '#7bc043',
	    visible: false,
            data: [<?php
                $sql = "SELECT R.percentage FROM rate R, champion C Where type_id = 2 AND R.champion_id = C.id AND C.cname = \"" . $_GET["champ"] . "\" ORDER BY R.id";
                $result = mysqli_query($conn, $sql);
                        if (mysqli_num_rows($result) > 0){
                                while($row = mysqli_fetch_assoc($result)){
                                        $name=$row["percentage"];
                                        echo"$name,";
                                }
                        }
                        ?>
        ]
        },{
            name: 'Ban-rate',
	    color: 'red',
	    visible: false,
            data: [<?php
		$sql = "SELECT R.percentage FROM rate R, champion C Where type_id = 3 AND R.champion_id = C.id AND C.cname = \"" . $_GET["champ"] . "\" ORDER BY R.id";
		$result = mysqli_query($conn, $sql);
			if (mysqli_num_rows($result) > 0){
				while($row = mysqli_fetch_assoc($result)){
					$name=$row["percentage"];
					echo"$name,";
				}
			}
			?>
		]
        }]
    });




});

</script>
<div style="height=1000px; width=800px; padding-left=200px">

<textarea id="PatchNotes" rows="19" cols="200" wrap="off"
readonly
style=" overflow-x: scroll; overflow:-moz-scrollbars-horizontal;height:53.5%; width: 100%;display: block;margin-left: auto;margin-right: auto;font-size: 20px;font-family:Times New Roman;color:#003399;resize: none;overflow:scroll;height=10px;"
>
</textarea>
<script>

document.getElementById("PatchNotes").value = "";


var champName;
var x = document.cookie;
console.log(x);
var preSplit = x.split(";");
for(i=0;i<preSplit.length;i++){
    if(preSplit[i].indexOf('champ')> -1){
        champName = preSplit[i];
    }
}

//var splitString = champName.split('=');

if (urlChampName.indexOf("%27") > -1){
    //console.log("found single quote");
    var y = urlChampName.split("%27");
    //console.log(y);
    y[0]=y[0].concat('\'');
    urlChampName = y[0].concat(y[1]);
}
if (urlChampName.indexOf("%20") > -1){
    //console.log("found single quote");
    var z = urlChampName.split("%20");
    //console.log(y);
    z[0]=z[0].concat(' ');
    urlChampName = z[0].concat(z[1]);
}



var patchNameArray = [
<?php
        $sql = "SELECT P.pname FROM patch_note PN, patch P, champion C WHERE PN.patch_id=P.id AND PN.champion_id=C.id AND C.cname = \"" . $_GET["champ"] . "\"  ORDER by PN.id";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
		 while ($row = mysqli_fetch_assoc($result)) {
                        $name=$row["pname"];
                        echo"\"$name\",";
                }
        }
?>
];


var patchNoteTypeArray = [
<?php
        $sql = "SELECT T.type FROM patch_note PN, champion C, patch_note_type T WHERE PN.type_id=T.id AND PN.champion_id=C.id AND C.cname = \"" . $_GET["champ"] . "\"  ORDER by PN.id";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
                while ($row = mysqli_fetch_assoc($result)) {
                        $name=$row["type"];
                        echo"\"$name\",";
                }
        }
?>
];


var patchNoteArray = [
<?php
        $sql = "SELECT PN.note FROM patch_note PN, champion C WHERE PN.champion_id=C.id AND C.cname = \"" . $_GET["champ"] . "\" ORDER by PN.id";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
                while ($row = mysqli_fetch_assoc($result)) {
                        $name=$row["note"];
                        echo"\"$name\",";
                }
        }
?>
];



var champNamePrinted = 0;
var currentPatch = "";

for (i=0;i<patchNoteArray.length;i++){
	var temp = document.getElementById("PatchNotes");
	if(champNamePrinted == 0){
		var champName = temp.value.concat(urlChampName + " Patch History:\n");
		document.getElementById("PatchNotes").value = champName;
		champNamePrinted = 1;
	}
	if(!(currentPatch === patchNameArray[i])){
		var patchName = temp.value.concat("\n" + patchNameArray[i] + ": \n");
		document.getElementById("PatchNotes").value = patchName;
		currentPatch = patchNameArray[i];
	}
	if(patchNoteTypeArray[i] === "Number neutral"){
		var patchType = temp.value.concat("\t" + patchNoteTypeArray[i] + "\t-\t");
                    document.getElementById("PatchNotes").value = patchType;
	}
	else if(patchNoteTypeArray[i] === "QoL buff" || patchNoteTypeArray[i] === "QoL nerf" || patchNoteTypeArray[i] === "Bug Fix"|| patchNoteTypeArray[i] === "Released"){
		var patchType = temp.value.concat("\t" + patchNoteTypeArray[i] + "\t\t\t-\t");
            	document.getElementById("PatchNotes").value = patchType;
	}
	else{
		var patchType = temp.value.concat("\t" + patchNoteTypeArray[i] + "\t\t-\t");
            	document.getElementById("PatchNotes").value = patchType;
	}
	var patchNote = temp.value.concat(patchNoteArray[i] + "\n");
            document.getElementById("PatchNotes").value = patchNote;
}




document.cookie = "champ="
var textarea = document.getElementById("PatchNotes");
textarea.scrollTop = 0;


</script>

</div>
<?php
mysqli_close($conn);
?>


