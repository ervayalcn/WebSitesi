<!DOCTYPE html>
<html lang="tr">

<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <link rel="stylesheet" type="text/css" href="tasar%C4%B1m.css">
    <link rel="stylesheet" type="text/css" href="Bilet.css">
    <title>MOVİE PARADISE</title>
    
    
    <!--Template based on URL below-->
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/starter-template/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Place your stylesheet here-->
    <link href="tasarim.css" rel="stylesheet" type="text/css">
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    

</head>
    
    
<body style="background-color: #333">
    <?php
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "filmler";
     
        
        $conn = mysqli_connect($servername, $username, $password, $dbname);
    
    if(!$conn){
        die("BAGLANTI BASARISIZ: " . mysqli_connect_error());
    }
    $sql = "Select film_ID, film_adi, film_resim from filmler where DATEDIFF(NOW(),vizyon)<61";
    $return = mysqli_query($conn, $sql);
    
    ?>
    
    
    <nav class="navbar navbar-expand-md navbar-dark bg-dark ">
    
    <a class="navbar-brand" href="Anasayfa1.php"><img src="Resimler/logo2.png" alt="logo" class="logo"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-1 ml-auto">
            <li class="nav-item">
                <a class="nav-link akla navbar-boyut" href="Anasayfa1.php">Anasayfa</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle akla navbar-boyut" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sıralama</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" id="izle" href="puan.php">Puan Sıralaması</a>
                    <a class="dropdown-item" id="imdb" href="imdb.php">Imdb Top 12</a>
                    <a class="dropdown-item" id="tarih" href="vizyon.php">Vizyon Tarihi</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link akla navbar-boyut" href="Biletal.php">Bilet</a>
            </li>
            <li class="nav-item">
                <a class="nav-link akla navbar-boyut" href="giris.php">Üyelik</a>
            </li>
            <?php
            if(isset($_SESSION["uyeid"]))
            {
            ?>
            <li class="nav-item">
                <a class="nav-link akla navbar-boyut" href="profil.php">Profil</a>
            </li>
            <?php } ?>
        </ul>
        <form style="margin-top: 15px">
<p>
<input type="arama" placeholder="Arama">
</p>
</form>
        
    </div>
</nav>
    
    <section class="kutu bg-dark">
        <div class="blt-row-filmler">
        <div class="row">
            <?php
            
      if(mysqli_num_rows($return) > 0)
      {
       
          while($row = mysqli_fetch_assoc($return))
          {
              echo "<div class='col-md-3 col-sm-3'>";
              echo "<a href='biletal.php?Flml=".$row["film_resim"]."&Flmid=".$row["film_ID"]."'><img src='" . $row["film_resim"] . "' class='blt-pht img-thumbnail phtglg' style='background-color: #696868;
    border: 1px solid #696868;'></a>";
              echo "<p style='color: #c9c9c9; font-size:19px'>".$row['film_adi']."</p>";
              echo "</div>";
          }
      }
              
            
    ?>
    
    </div>
    </div>
        <br>
        <div class="blt-alm" id="biletalmagenel">
        <div class="container blt-ekr">
            <div class="row">
                <div class="col-md-9 col-sm-9">
                
                    <?php 
                    if(isset($_GET['Flml']))
                    {  
            $sql3 = "SELECT film_adi FROM filmler WHERE filmler.film_ID=".$_GET['Flmid'];
    $return3 = mysqli_query($conn, $sql3);
            if(mysqli_num_rows($return3) > 0)
      {
          while($row3 = mysqli_fetch_assoc($return3))
          {
              
          
              echo "<p style='margin-top: 30px; margin-bottom: -15px; font-size: 30px;color:#d9d9d9'>".$row3["film_adi"]."</p>";
              
          }
      }   
                    }
            ?>
            </div>
            </div>
            <div class="row">
                
            <div class="col-md-3 col-sm-3">
                <?php
          if(isset($_GET['Flml']))
          {
              echo "<img id='biletfilmresim' src='".$_GET['Flml']."' class='blt-pht img-thumbnail phtglg' style='background-color: #434343;
    border: 1px solid #434343;'>";

              echo "<a id='flmtntm' href='film.php?Fid=".$_GET['Flmid']."' class='btn btn-primary golge text-light active' role='button' aria-pressed='true' style='background: #a964d4;margin-top: 10px;text-align: center;'><b>Film Tanıtımı</b></a>";
          }
          else
          {
              
          }
    ?>    
            </div>
                <?php
                if(isset($_GET['Flmid']))
                {
                ?>
            <div class="col-md-9 col-sm-9" style="margin-top: 30px">
            <form class="form-horizontal" action="biletal.php" method="post">
                <div class="form-group">
      <label class="control-label col-sm-4">Şehir</label>
      <div class="col-sm-5">
        <select class="form-control" id="sehir" name="sehir">
        <option disabled selected value="">Şehir Seçin</option>
        <option value="Adana">Adana</option>
        <option value="Ankara">Ankara</option>
        <option value="Balikesir">Balikesir</option>
        <option value="Edirne">Edirne</option>
        <option value="Istanbul">Istanbul</option>
        <option value="Samsun">Samsun</option>
        <option value="Sivas">Sivas</option>
        <option value="Trabzon">Trabzon</option>
        <option value="Zonguldak">Zonguldak</option>
      </select>
      </div>
    </div>
                <div class="form-group">
      <label class="control-label col-sm-4">Tarih</label>
      <div class="col-sm-5">
          <input type="date" id="tarih" name="tarih" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">Salon</label>
      <div class="col-sm-5">
        <select class="form-control" id="salon" name="salon" onchange="FetchState(this.value)" required>
        <option disabled selected>Salon Seçin</option>
            <?php 
            $sql1 = "SELECT salon_adi,salon_ID FROM filmler,salon WHERE filmler.film_ID=salon.film_ID AND filmler.film_ID=".$_GET['Flmid'];
    $return1 = mysqli_query($conn, $sql1);
            if(mysqli_num_rows($return1) > 0)
      {
          while($row1 = mysqli_fetch_assoc($return1))
          {
             echo "<option value='".$row1["salon_ID"]."'>".$row1["salon_adi"]."</option>"; 
          }
      }
            ?>
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">Saat</label>
      <div class="col-sm-5">
        <select class="form-control" id="saat" name="saat"d>
        <option disabled selected value="">Saat Seçin</option>
                 
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">Koltuk No(Her Koltuk 15₺)</label>
        <div class="row" >    
      <div class="col-sm-5">
          <select style="height:200px;" name="koltukliste[]" class="form-control" multiple>
              <option value="" disabled>Koltuk Secin</option>
              
              <?php 
            $sql18 = "SELECT koltuk_ID,koltuk_NO FROM koltuk";
    $return18 = mysqli_query($conn, $sql18);
            if(mysqli_num_rows($return18) > 0)
      {
          while($row18 = mysqli_fetch_assoc($return18))
          {
             echo "<option value='".$row18["koltuk_ID"]."'>".$row18["koltuk_NO"]."</option>"; 
          }
      }
            ?>

          </select>
        </div>
            </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">Kart No</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" value="" id="crdno" placeholder="Kart Numaranızı Girin" name="cardno" maxlength="16">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">VALID THRU</label>
      <div class="col-sm-5">          
        <input class="form-control" type="month" value="2021-07" id="sn-trh">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">CVC2 No</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" id="cvc2" value="" placeholder="cvc2 No" name="cvc2" maxlength="3">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember" required><a href="#" style="color: white">Sözleşmeleri okudum ve kabul ediyorum.</a></label>
        </div>
      </div>
    </div>
                <?php
                if(isset($_GET['Flmid']))
                {
                echo "<input type='hidden' id='filmidcek' name='filmidcek' value='".$_GET['Flmid']."'>";
                }
                ?>
                
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" name="butonlarr" class="btn text-light golge" style="background: #a964d4;" onclick="btnkontrol()"><b>BİLETİ AL</b></button>
      </div>
    </div>
  </form>
        </div>
                <?php
                }
                ?>
    </div>
 </div>
</div>
 <br>
        <?php 
        
        if(isset($_POST['butonlarr']))
        {
            if(isset($_POST['salon'])&&isset($_POST['saat'])&&isset($_POST['tarih'])&&isset($_POST['filmidcek'])&&isset($_POST['koltukliste'])&&isset($_SESSION['uyeid']))
            {
            $Dd=$_POST['salon'];
            $Ss=$_POST['saat'];
            $Tt=$_POST['tarih'];
            $Gg=$_POST['filmidcek'];
            $Hh=$_POST['sehir'];
            $Uu=$_SESSION["uyeid"];
            $koltuknola = $_POST['koltukliste'];
            
            foreach($koltuknola as $item)
            {
                 $sql14 = "INSERT INTO bilet (film_ID, seans_ID, salon_ID, koltuk_ID, uye_ID, b_tarih, b_sehir) VALUES ('$Gg','$Ss','$Dd','$item','$Uu', '$Tt', '$Hh')";
                
                    if(mysqli_query($conn, $sql14))
                {
                        
                }
                else
                {
                    $message2 = "Bilet alma işlemi başarısız.";
                    echo "<script type='text/javascript'>alert('$message2');</script>"; 
                }
                
            }
                $message = "Biletiniz alınmıştır. Profilinizden erişebilirsiniz.";
                    echo "<script type='text/javascript'>alert('$message');</script>"; 
            }
            else
            {
                $message3 = "Bilet alma işlemi başarısız. Üye girişi yapınız.";
                echo "<script type='text/javascript'>alert('$message3');</script>";
            }
        }
        ?>
        
    </section>
    
    <footer class="bg-dark expand-md bg">
        <div class="container">
            <div class="row">
            <div class=" mb-2 mt-2 col-12 col-md-4">
                <img src="Resimler/logo2.png" class="logo1 ">
            </div>
            <div class="text-secondary mt-4 col-12 col-md-4" style="display: inline-block">
                <small>Copyright©️ 2021 Tüm Hakları Saklıdır.</small>
                <br>
                
                
                <div class="mt-2 ikn">
                <a href="#"><img class="ikon" src="Resimler/instagram.png"></a>
                <a href="#"><img class="ikon" src="Resimler/facebook.png"></a>
                <a href="#"><img class="ikon" src="Resimler/twitter.png"></a>
                </div>
            </div>
            <div class="mb-3 mt-3 col-12 col-md-4">
                <ul class="text-secondary list-unstyled mb-2">
                    <li><a href="#" class="text-muted">Hakkımızda</a></li>
                    <li><a href="#" class="text-muted">Bize Ulaşın</a></li>
                    <li><a href="#" class="text-muted">Gizlilik</a></li>
                </ul>
            </div>
            <div style="clear: left"></div>
            </div>
        </div>
    </footer>
    <script>

        
        function btnkontrol(){
            var salon = document.getElementById("salon");
            var saat = document.getElementById("saat");
            var cardno = document.getElementById("crdno");
            var cvc2 = document.getElementById("cvc2");
            var koltuk = document.getElementById("sel2");
            if(sehir.value !=""){
               if(salon.value != ""){
                if(saat.value != ""){
                    if(cardno.value.length == 16){
                        if(cvc2.value.length == 3){
                               return true; 
                           }
                           else{alert("Cvc2 Kodunu Dogru ve Eksiksiz Girin");
                               return false;}
                       }
                    else{alert("Kart Numaranızı Doğru ve Eksiksiz Girin");
                        return false;}
                    
                   }
                else{alert("Saat Seçin");
                    return false;}
               }
            else{alert("Salon Seçin");
                return false;}  
            }
          else{alert("Şehir Seçin")
              return false;}
            
        }
    </script>
    <script type="text/javascript">
  function FetchState(id){
    $('#saat').html('');
    $.ajax({
      type:'post',
      url: 'ajaxdata1.php',
      data : { salonno_id : id},
      success : function(data){
         $('#saat').html(data);
      }

    })
  }
        </script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
</body>
</html>