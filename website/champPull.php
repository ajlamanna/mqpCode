<?php 



$conn = new mysqli($servername, $username, $password, $dbname);
if($conn->connect_error) {
	die("Connection Failed: " .$conn->connect_error);
}



?>


<html>
<head>
    <title></title>
	<meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body onload="populate()">

    <div id="titleEmblem">
        <img src="images/Emblem.png" width="25%" height="25%"/>
    </div>

    <div id="patch">
        <p style="font-size: 1.45em;">League of Legends Crawler is the result of a Major Qualifying Project by a group of students at Worcester Polytechnic Institute. This project gathers data from the League of Legends API and displays information which pairs changes to champions and their corresponding pick-rates, win-rates, and ban-rates. This allows users to view the effect a change has on a champion’s strength as well as view all changes made to a champion. Users can filter information and overlay different types of data.
</p>
    </div>
    <div id="Tabs">
        <ul>
            <li id="li_tab1" onclick="tab('tab1')"><a>Champions</a></li>
            <li id="li_tab2" onclick="tab('tab2')"><a>Credits</a></li>
            <li style="visibility: hidden;" id="li_tab3" onclick="tab('tab3')"><a>Documentation</a></li>
        </ul>
        <div id="Content_Area">
            <div id="tab1">
                <div id="tableArea" style="overflow:auto;">
                </div>
            </div>

            <div id="tab2" style="display: none;">
                <div id="creditsTable" style="overflow:auto; text-align: left;">
                    <br />
                    <p style="font-size: 1.35em; padding-left:15px; line-height: 80%;"> Artian Kica, Andrew La Manna, Lindsay O'Donnell and Thomas Paolillo.</p>
                    <p style="font-size: 1.35em; padding-left:15px; line-height: 80%;"> "Analysis of Data Gathered from League of Legends and the Riot Games API"</p>
                    <p style="font-size: 1.35em; padding-left:15px; line-height: 80%;"> Major Qualifying Project MQP-MLC-LL15, Computer Science, Worcester Polytechnic Institute, Spring 2016.</p>
                    <p style="font-size: 1.35em; padding-left:15px; line-height: 80%;"> Advisor: Mark Claypool </p>
                    <p style="font-size: 1.35em; padding-left:15px; line-height: 80%;"> Online at: <a href="http://www.cs.wpi.edu/~claypool/mqp/lol-crawler/">http://www.cs.wpi.edu/~claypool/mqp/lol-crawler/</a>  </p>
                </div>
            </div>
            <div id="tab3" style="display: none;">
            </div>
        </div>
    </div>
</body>
 

<html>


<script>
var champArray = [
	<?php
	    $sql = "SELECT * FROM champion ORDER BY cname";
		$result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) > 0) {
			while ($row = mysqli_fetch_assoc($result)) {
				$name=$row["picname"];
				echo"'$name',"; 
			}
		}
		?>
];

var displayArray = [
    <?php
        $sqlName = "SELECT * FROM champion ORDER BY cname";
        $resultName = mysqli_query($conn, $sqlName);

        if (mysqli_num_rows($resultName) > 0) {
            while ($rowName = mysqli_fetch_assoc($resultName)) {
                $nameName=$rowName["cname"];
                echo"\"$nameName\","; 
            }
        }
        ?>
];



function populate() {
        numChamp = displayArray.length;
	counter = 0;

        var tbl = document.createElement("table");
        tbl.setAttribute("style", "overflow:auto;width:100%;margin-left:auto;margin-right:auto;")
        var tblBody = document.createElement("tbody");
        tblBody.setAttribute("style", "overflow:auto;")

        var x = 16;
        while(counter < ((numChamp+numChamp%16)-numChamp%16)){
		if (counter == (numChamp - numChamp%16)){
			x = numChamp%16;
		}
            var row = document.createElement("tr");
            for (j=0;j<x;j++) {
                var cell = document.createElement("td");
                var areaDiv = document.createElement("div");
                areaDiv.setAttribute("class", "area");
                var champDiv = document.createElement("div");
                champDiv.setAttribute("class", "champPic");
		var imgRef = document.createElement("a");
		imgRef.setAttribute("href", "graph.php?champ="+ displayArray[counter]);
		imgRef.setAttribute("onclick", "passChampMod(this);");
		imgRef.setAttribute("id", champArray[counter]);
                var img = document.createElement("img");
                img.setAttribute("src", "images/" + champArray[counter] + "_Square_0.png");
		img.setAttribute("width","65%");
		img.setAttribute("hieght", "65%");
                var a = document.createElement("a");
                a.setAttribute("href", "graph.php?champ=" + displayArray[counter]);
                a.setAttribute("id", champArray[counter]+"link");
                a.setAttribute("onclick", "passChamp(this);");
                var name = document.createElement("div");
                name.setAttribute("class", "name");
                a.textContent = displayArray[counter];

                name.appendChild(a);
		imgRef.appendChild(img);
                champDiv.appendChild(imgRef);
                areaDiv.appendChild(champDiv);
                areaDiv.appendChild(name);

                cell.appendChild(areaDiv);
                row.appendChild(cell);
                counter++;

            }

                tblBody.appendChild(row);
        }
        tbl.appendChild(tblBody);
        tableArea.appendChild(tbl);

    }
    var temp = document.getElementById("Chogath");


     function tab(tab) {
        document.getElementById("tab1").style.display = 'none';
        document.getElementById("tab2").style.display = 'none';
        document.getElementById("tab3").style.display = 'none';
        document.getElementById("li_tab1").setAttribute('class', " ");
        document.getElementById("li_tab2").setAttribute('class', " ");
        document.getElementById("li_tab3").setAttribute('class', " ");
        document.getElementById(tab).style.display = 'block';
        document.getElementById("li_" + tab).setAttribute('class', "active");
    }

    function passChamp (clickedchamp) {
        var cookie = clickedchamp.innerHTML; 
        /*if(cookie.indexOf("'") > -1){
            var x = cookie.split("'");
            x[0].concat("&#39");
            console.log(x[0]);
            cookie = x[0].concat(x[1]); 
        } */
        //document.getElementById("champNameForm").setAttribute("value", cookie); 
        //document.champNameForm.submit(); 
        //document.cookie="champ=" + cookie;  
        //console.log(cookie); 
    }

    function passChampMod (clickedchamp){
        var name = clickedchamp.id; 
        //var cName = document.getElementById(name + "link"); 
        //var name1= document.getElementById(name);
        //var cookie = cName.innerHTML; 
        //document.cookie="champ=" + cookie; 
    }


</script>

<?php
  echo '</br>';
  include 'disclaimer.html';
  mysqli_close($conn);

?> 
