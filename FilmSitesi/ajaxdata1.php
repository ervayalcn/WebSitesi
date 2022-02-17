<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "filmler";
        $conn = mysqli_connect($servername, $username, $password, $dbname);
    if(!$conn){
        die("BAGLANTI BASARISIZ: " . mysqli_connect_error());
    }
            if (isset($_POST['salonno_id'])) {
            $sql2 = "SELECT seans.seans_ID, seans_saati FROM filmler,seans,salon_seans,salon WHERE filmler.film_ID=salon.film_ID AND salon.salon_ID=salon_seans.salon_ID AND salon_seans.seans_ID=seans.seans_ID AND salon_seans.salon_ID=".$_POST['salonno_id'];
    $return2 = mysqli_query($conn, $sql2);
            if(mysqli_num_rows($return2) > 0)
      {
                echo '<option disabled selected value="">Saat Seçin</option>';
          while($row2 = mysqli_fetch_assoc($return2))
          {
             echo "<option value='".$row2["seans_ID"]."'>".$row2["seans_saati"]."</option>"; 
          }
      }  
            }
            ?> 