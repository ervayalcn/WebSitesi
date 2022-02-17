<?php
ob_start();
session_start(); 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "filmler";

$conn = mysqli_connect($servername, $username, $password, $dbname);
mysqli_set_charset($conn, "utf8");
    
if(!$conn){
    die("BAGLANTI BASARISIZ: " . mysqli_connect_error());
}

$sorgu = "SELECT * FROM uyeler where uye_ID=".$_SESSION["uyeid"];
$veri = mysqli_query($conn, $sorgu);
$veri1 = mysqli_query($conn, $sorgu);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <link rel="stylesheet" type="text/css" href="tasarim.css">
    <title>MOVİE PARADISE</title>
    
    <!--Template based on URL below-->
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/starter-template/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Place your stylesheet here-->
    <link href="tasarim.css" rel="stylesheet" type="text/css">
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
</head>
    
<body style="background-color: #333">
    
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
                    <a class="dropdown-item" href="beg1.html">En Beğenilenler</a>
                    <a class="dropdown-item" href="izle1.html">En Çok İzlenenler</a>
                    <a class="dropdown-item" href="imdb1.html">Imdb Top</a>
                    <a class="dropdown-item" href="tarih1.html">Çıkış Tarihi</a>
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
    <section class="kutu bg-dark" style="color:#fff">
        <div class="container">
            <!-- <p style="text-align:center">PROFİL SAYFASINA HOŞGELDİNİZ</p><hr> -->
            <a class='btn float-right' style="margin-top:20px;border-radius:20px; background-color:#a964d4;color:azure" href=cikis.php>ÇIKIŞ</a>
            <?php 

            while($den = mysqli_fetch_array($veri))
            {
                echo "<form action='profil.php' method='post'>";
                echo "<table class='table table-dark' style='margin-top:-45px'>";
                echo "<tr scope='col'><td style='font-size: 25px;color: #a964d4'><b>Hoşgeldin  ". $den['uye_adi'] ." </b></td></tr><hr>";
                echo "<tr scope='col'><td><b style='color: #d29cf4'>Kullanıcı: </b> ".$den['uye_adi'] ." ".$den['uye_soyadi']."</td></tr><br>";
                echo "<tr scope='col'><td><b style='color: #d29cf4'>Telefon: </b> ".$den['telefon'] ."</td></tr><br>";
                echo "<tr scope='col'><td><b style='color: #d29cf4'>Mail: </b> ".$den['mail'] ."</td></tr><br>";
                echo "<tr scope='col'><td><b style='color: #d29cf4'>Doğum Tarihi: </b> ".$den['dogum_tarihi'] ."</td></tr><br>";
                echo "</table>";
                echo "<button type='submit' name='ac' class='btn ' style='background: #a964d4;text-align: center;color:azure'>Bilgileri Güncelle</button>";
                echo "</form>";
                echo "<hr>";
                
            }
                

                
                $bilet_sorgu = "SELECT film_adi,seans_saati,salon_adi,koltuk_no,b_tarih,b_sehir FROM bilet,filmler,seans,salon,koltuk WHERE bilet.film_ID=filmler.film_ID AND bilet.seans_ID=seans.seans_ID AND bilet.salon_ID=salon.salon_ID AND bilet.koltuk_ID=koltuk.koltuk_ID AND uye_ID=".$_SESSION["uyeid"];
                $biletler = mysqli_query($conn, $bilet_sorgu);

                ?>
             <?php

                if(isset($_POST['update'])){
                    $yeni_isim = trim($_POST['yeni_isim']);
                    $yeni_soyisim = trim($_POST['yeni_soyisim']);
                    $yeni_mail = trim($_POST['yeni_mail']);
                    $yeni_tel = trim($_POST['yeni_telefon']);
                    $yeni_sifre = trim($_POST['yeni_sifre']);
                    $hash_sifre =hash("sha512",$yeni_sifre);

                    if(empty($yeni_sifre) && !empty($yeni_isim) && !empty($yeni_soyisim) && !empty($yeni_mail) && !empty($yeni_tel)){

                        $query = "UPDATE uyeler SET uye_adi=?, uye_soyadi=?, mail=?, telefon=? WHERE uye_ID=?";
                        $statement = $conn->prepare($query);
                        $statement->bind_param('ssssi', $yeni_isim, $yeni_soyisim,$yeni_mail,$yeni_tel, $_SESSION['uyeid']);
                        $statement->execute();
                        echo '<p class="alert alert-success">Şifre Dışındaki Bilgiler Güncellendi</p>';
                        header("Refresh: 3; url=profil.php");
                    }
                    else if(!empty($yeni_sifre) && !empty($yeni_isim) && !empty($yeni_soyisim) && !empty($yeni_mail) && !empty($yeni_tel)){
                        $query = "UPDATE uyeler SET uye_adi=?, uye_soyadi=?, mail=?, telefon=?, sifre=? WHERE uye_ID=?";
                        $statement = $conn->prepare($query);
                        $statement->bind_param('sssssi', $yeni_isim, $yeni_soyisim,$yeni_mail,$yeni_tel,$hash_sifre, $_SESSION['uyeid']);
                        $statement->execute();
                        echo '<p class="alert alert-success">Tüm Bilgiler Güncellendi</p>';
                        header("Refresh: 3; url=profil.php");
                    }
                    else{
                        echo '<p class="alert alert-danger">İsim, Soyisim, E-Posta ve Telefon bilgileri boş bırakılamaz!</p>';
                        header("Refresh: 3; url=profil.php");
                    }                    
                }

                ?>
            
                <?php
            if(isset($_POST['ac']))
            {
            ?>
                <h4   style="color: #a964d4"><b>BİLGİ GÜNCELLE</b></h4><hr>
                <form action="" method="POST">
                        <?php
                        while($den1 = mysqli_fetch_array($veri1))
                        {
                        ?>
                        <div class="form-group row">
                            <label for="isim" class="col-sm-2 col-form-label" style="color: #d29cf4"><b>İsim: </b></label>
                            <div class="col-sm-10">
                            <input type="text" style="width:400px;height:35px" class="form-control" name="yeni_isim" value="<?php echo $den1['uye_adi'] ?>" id="isim" placeholder="İsim">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="soyisim" class="col-sm-2 col-form-label" style="color: #d29cf4"><b>Soyisim: </b></label>
                            <div class="col-sm-10">
                            <input type="text" style="width:400px;height:35px" class="form-control" name="yeni_soyisim" value="<?php echo $den1['uye_soyadi'] ?>" id="soyisim" placeholder="Soyisim">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="mail" class="col-sm-2 col-form-label" style="color: #d29cf4"><b>E-posta: </b></label>
                            <div class="col-sm-10">
                            <input type="email" style="width:400px;height:35px" class="form-control" name="yeni_mail" value="<?php echo $den1['mail'] ?>" id="mail" placeholder="E-Posta">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="telefon" class="col-sm-2 col-form-label" style="color: #d29cf4"><b>Telefon: </b></label>
                            <div class="col-sm-10">
                            <input type="text" style="width:400px;height:35px" class="form-control" name="yeni_telefon" maxlength="10" value="<?php echo $den1['telefon'] ?>" id="telefon" placeholder="Telefon">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yeni_sifre" class="col-sm-2 col-form-label" style="color: #d29cf4"><b>Yeni Şifre: </b></label>
                            <div class="col-sm-10">
                            <input type="password" style="width:400px;height:35px" class="form-control" name="yeni_sifre" id="yeni_sifre" placeholder="Yeni Şifre">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                            <button type="submit" name="update" class="btn float-left" style="background: #a964d4;text-align: center;color:azure;margin-left:504px">Güncelle</button>
                            </div>
                        </div>

                        <?php
                        }
                        ?>
                </form>
                    <?php
                        }
            echo "<h3 style='margin-top: 20px;font-size 45px;color: #a964d4'><b>BİLETLER</b></h3> <hr>";
                        ?>
            
                    <table class="table table-dark" style='margin-top:25px'>
                        <thead>
                            <tr style="color: #d29cf4">
                            <th scope="col">FİLM ID</th>
                            <th scope="col">SEANS ID</th>
                            <th scope="col">SALON ID</th>
                            <th scope="col">KOLTUK ID</th>
                            <th class="text-center" scope="col">TARİH</th>
                            <th scope="col">ŞEHİR</th>
                            </tr>
                        </thead>
                    <tbody>
                <?php

                //Kullanıcı biletlerini çek
                while($satir = mysqli_fetch_array($biletler)){
                    ?>
                        <tr>
                        <th><?= $satir['film_adi']; ?></th>
                        <th class="text-center"><?= $satir['seans_saati']; ?></th>
                        <th><?= $satir['salon_adi']; ?></th>
                        <th class="text-center"><?= $satir['koltuk_no']; ?></th>
                        <th><?= $satir['b_tarih']; ?></th>
                        <th><?= $satir['b_sehir']; ?></th>

                        </tr>
                    <?php
                }

                ?>
                </tbody>
                </table>
                
           
        </div>
        <br>
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
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
</body>