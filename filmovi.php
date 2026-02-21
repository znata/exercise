
<!doctype html>

<head></head>
<body>
<div><a href="filmovi.php"><H3>FILMOVI</H3></a>
<a href="bioskopskeKarte.php"><H3>BIOSKOPI - PRIKAZIVANJE FILMOVA</H3></a></div>

<FORM name="form_a"> 

<B><I>Izaberite film:</I></B>

<p><SELECT name="Filmovi">
<OPTION value="1" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '1') ? 'selected' : ''; ?>>Montevideo, Bog te video!  </OPTION>
<OPTION value="2" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '2') ? 'selected' : ''; ?>>Balkanska međa </OPTION>
<OPTION value="3" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '3') ? 'selected' : ''; ?>>Toma </OPTION>
<OPTION value="4" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '4') ? 'selected' : ''; ?>>Šešir profesora Koste Vujića  </OPTION>
</SELECT>
<pre>
	<input class='buttons' name="button1" type="submit" value="Prikazi opis filma">


 <p>Kratak opis filma: <?php 

if(isset($_GET['Filmovi'])){
$var = $_GET['Filmovi'];

if($var == "1"){
echo"Montevideo, Bog te video!";
}
if($var == "2"){
echo"Balkanska međa ";
}
if($var == "3"){
echo"Toma";
}
if($var == "4"){
echo"Šešir profesora Koste Vujića";
}
}
?><p> <TEXTAREA name="opis" rows="15" cols="100" >
     <?php 
if(isset($_GET['Filmovi'])){
$var = $_GET['Filmovi'];


include_once('db.php');

// povezivanje sa MySQL bazom podataka
$db = db_connect();
         

$sql = "SELECT * FROM bioskop.film";
$result = $db->query($sql);

if ($result->num_rows > 0 ) {
	while($row = $result->fetch_assoc()) {
			if ($row["idf"]==$var){

				echo $row["opis"];
			}
  }
} else {
  echo "0 results";
}
        // zatvaramo konekciju ka bazi podataka
db_close($db);
      

}
?></TEXTAREA>
</FORM > 
<HR></pre>


</body>

<html>