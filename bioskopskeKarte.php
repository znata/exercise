
<!doctype html>

<head></head>
<body>

<div><a href="filmovi.php"><H3>FILMOVI</H3></a>
<a href="bioskopskeKarte.php"><H3>BIOSKOPI - PRIKAZIVANJE FILMOVA</H3></a></div>

<FORM name="form_b" > 
<B><I>Izaberite film:</I></B>
<p><SELECT name="Filmovi">
<OPTION value="1" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '1') ? 'selected' : ''; ?>>Montevideo, Bog te video!  </OPTION>
<OPTION value="2" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '2') ? 'selected' : ''; ?>>Balkanska međa </OPTION>
<OPTION value="3" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '3') ? 'selected' : ''; ?>>Toma </OPTION>
<OPTION value="4" <?php echo (isset($_GET['Filmovi']) && $_GET['Filmovi'] === '4') ? 'selected' : ''; ?>>Šešir profesora Koste Vujića  </OPTION>
</SELECT>

<p>
<table>
	<tr>
	<th><B><I>Izaberite bioskop:</I></B></th>
<th><B><I>Odaberite sedista:</I></B></th>
</tr>
<tr>
<td>
<p><SELECT name="Bioskopi">
<OPTION value="1" <?php echo (isset($_GET['Bioskopii']) && $_GET['Bioskopi'] === '1') ? 'selected' : ''; ?>>Fontana</OPTION>
<OPTION value="2" <?php echo (isset($_GET['Bioskopi']) && $_GET['Bioskopi'] === '2') ? 'selected' : ''; ?>>Cineplexx Ušće</OPTION>
<OPTION value="3" <?php echo (isset($_GET['Bioskopi']) && $_GET['Bioskopi'] === '3') ? 'selected' : ''; ?>>Cineplexx 4D Delta City</OPTION>
<OPTION value="4" <?php echo (isset($_GET['Bioskopi']) && $_GET['Bioskopi'] === '4') ? 'selected' : ''; ?>>Zvezda </OPTION>
</SELECT>
</td>

<td>
<UL type="square">
<LI><INPUT type="checkbox" name='checkbox[]' value ="box"> &nbsp; 1 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box">  &nbsp;2 &nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box"> &nbsp; 3 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box">  &nbsp;4 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"> &nbsp; 5 &nbsp;
	
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> &nbsp; 6&nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> &nbsp; 7 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> &nbsp; 8&nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box"/> &nbsp; 9 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/>  10 &nbsp;
	

</LI>
<LI>
    <INPUT type="checkbox" name='checkbox[]' value ="box"> 11 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"> 12&nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box"> 13 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"> 14&nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"> 15 &nbsp;
	
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> 16&nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> 17 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> 18&nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box"/> 19 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> 20&nbsp;
</LI>


<LI>
    <INPUT type="checkbox" name='checkbox[]' value ="box">  21 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box">  22&nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box">  23 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box">  24&nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box">  25 &nbsp;
	
	<INPUT type="checkbox" name='checkbox[]' value ="box"/> 26&nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/>  27 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/>  28&nbsp;
    <INPUT type="checkbox" name='checkbox[]' value ="box"/>  29 &nbsp;
	<INPUT type="checkbox" name='checkbox[]' value ="box"/>  30&nbsp;
</LI>
</UL>

</td>
</tr>
<tr>
	<td colspan="2">
<input class='buttons' name="buttonsalji" type="submit" value="Izracunaj ukpnu sumu">

</td>
</tr>
<tr>
	<td colspan="2">
<p>
<?php 
if(isset($_GET['checkbox'])){
$checked_arr = $_GET['checkbox'];
$count = count($checked_arr);

if(isset($_GET['Filmovi']) & isset($_GET['Bioskopi'])){
$var = $_GET['Filmovi'];
$var1 = $_GET['Bioskopi'];
///////////////////////db/////////////////////////
  include_once('db.php');

// povezivanje sa MySQL bazom podataka
$db = db_connect();
         
$stmt = $db->prepare("SELECT * FROM bioskop.prikazivanje WHERE idf=? AND idb=?");
$stmt->bind_param( 'ii', $var , $var1);
$stmt->execute();
$result2 = $stmt->get_result();
$num_rows = mysqli_num_rows($result2);
//$sql = "SELECT * FROM bioskop.prikazivanje WHERE idf=$var AND idb=$var1";
//$result2 = $db->query($sql);

if ($num_rows==0 ) {
	echo "Film se ne prikazuje u izabranom bioskopu.";
	} 

else
{
 
$stmt1 = $db->prepare("SELECT * FROM bioskop.film WHERE idf=?");
$stmt1->bind_param( 'i', $var);
$stmt1->execute();
$result1 = $stmt1->get_result();
$followingdata = $result1->fetch_assoc();  // pretvara rezultat u niz

$stmt2 = $db->prepare("SELECT * FROM bioskop.bioskop WHERE idb=?");
$stmt2->bind_param( 'i', $var1);
$stmt2->execute();
$result3 = $stmt2->get_result();
$followingdata1 = $result3->fetch_assoc();  // pretvara rezultat u niz

				$cena = $count *  $followingdata["cena"];
				echo "Cena karte za odabrani film je ".$followingdata["cena"]." dinara. \n";
				echo "Ukupna cena za ".$count." karte za film ".$followingdata["nazivf"]." u bioskopu ".$followingdata1["nazivb"]. " je: ".$cena." dinara.";
			}
  
       // zatvaramo konekciju ka bazi podataka
db_close($db);
  }  }  
//////////////////////////////////////////////////////////////////

?>

</td>
</tr>


</FORM>

</body>

<html>