<?php
    error_reporting(0);
    session_start();
    $servername= "localhost";
    $username= "root";
    $password= "";  
    $dbname= "filmler";

    $conn = new mysqli($servername, $username, $password, $dbname);
    $new = mysqli_set_charset($conn,"utf8");
    if ($conn ->connect_error)
    {
        die("Bağlantı Hatası: ". $conn->connect_error);
    }
  
    $bul= "SELECT filmler.film_ID,film_resim,film_adi,yonetmen_adi,yonetmen_soyadi,IMDB,yapim_yili,yapim_yeri_adi, kategori_adi,tur_adi,vizyon,oyuncu_adi,oyuncu_soyadi,aciklama,fragman FROM filmler,yonetmen,yapim,yapim_yeri,kategori,tur,film_oyuncu,oyuncu WHERE yonetmen.yonetmen_ID=filmler.yonetmen_ID AND filmler.yapim_ID=yapim.yapim_ID AND yapim.yapim_yeri_id=yapim_yeri.yapim_yeri_id AND filmler.kategori_ID=kategori.kategori_ID AND filmler.tur_ID=tur.tur_ID AND film_oyuncu.film_ID=filmler.film_ID AND film_oyuncu.oyuncu_ID=oyuncu.oyuncu_ID AND filmler.film_ID=".$_GET['Fid'];
    $kayit=mysqli_query($conn,$bul);
    if(mysqli_num_rows($kayit)>0)
    {
        while($row=mysqli_fetch_array($kayit))
        {
            $resim=$row['film_resim'];
            $isim=$row['film_adi'];
            $imdb=$row['IMDB'];
            $yntmn_adi=$row['yonetmen_adi'];
            $yntmn_soyadi=$row['yonetmen_soyadi'];
            $yil=$row['yapim_yili'];
            $yer=$row['yapim_yeri_adi'];
            $kategori=$row['kategori_adi'];
            $tur=$row['tur_adi'];
            $vizyon=$row['vizyon'];
            $aciklama=$row['aciklama'];
            $fragman=$row['fragman'];
            $filmid=$row['film_ID'];
        }
    }
    else
    {
      
    }
               

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
        <?php
                if(isset($_GET['Fid']))
                {
                ?>
        <div>
        <div class="row">
            <div class="col-12 col-md-6">
                <div class="film"><?php echo $isim; ?></div>
            </div>
            <div class="col-12 col-md-6">
            <div class="row">
                <div class="col-6 col-md-12 col-lg-12 col-xl-6"><div class="im">IMDB <span style="color: #ffff00"><?php echo $imdb; ?></span></div></div>
                <div class="col-6 col-md-12 col-lg-12 col-xl-6">
                <div class="yildiz">
                    <form class="puan" action="film.php?<?php echo "Fid=".$_GET['Fid']; ?>" method="post" > 
                        <img style="width: 30px; height: 30px; float: left; padding-bottom: 6px" src="Resimler/y%C4%B1ld%C4%B1z.png"> 
                        <select name="oylama" class="rating">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <input type="submit" class="oy" name="oyla" value="Oyla">
                        <?php
                            if(isset($_POST["oylama"]))
                            {
                                $uyeoy=$_SESSION["uyeid"];
                                $rating=$_POST["oylama"];
                               
                                $sorgu44="INSERT INTO puan (uye_ID, puan_degeri, film_ID) VALUES ('$uyeoy', '$rating' , '$filmid')";
                                 if(mysqli_query($conn, $sorgu44))
                                {
                                     $message44 = "Puanınız alındı.";
                                    echo "<script type='text/javascript'>alert('$message44');</script>";
                                }
                                else
                                {
                                    $message22 = "Puan alma işlemi başarısız. Üyelik girişi yapınız.";
                                    echo "<script type='text/javascript'>alert('$message22');</script>";
                                }
                            }
                        
                        ?>
                        
                        <div class="sayi"><?php
                                            $sql21 = "SELECT ROUND(AVG(puan_degeri),1) FROM puan WHERE film_ID=".$_GET['Fid'];
                                            $return21 = mysqli_query($conn, $sql21);
                                                    if(mysqli_num_rows($return21) > 0)
                                              {
                                                  while($row21 = mysqli_fetch_assoc($return21))
                                                  {
                                                      echo $row21["ROUND(AVG(puan_degeri),1)"]. "/10";
                                                  }   
                                              } 
                                            ?>
                        </div>
                        
                    </form>
                </div>
                </div>
            </div>
            </div>
        </div>
        <div>
            
        <div class="row">
            <div class="col-5 col-sm-2 col-md-2">
                <div><?php echo "<img class='foto' src='$resim'>"; ?></div>
                <?php
                    $sql88 = "Select film_ID from filmler where DATEDIFF(NOW(),vizyon)<61 && film_ID=".$_GET['Fid'];
                    $return88 = mysqli_query($conn, $sql88);
                    if(mysqli_num_rows($return88)>0)
                        {
                            while($row2=mysqli_fetch_array($return88))
                            {
                                if(isset($row2))
                                {
                                    ?>
                                    <button  class="blt" type="button" style="background-color: #ffff00" onclick="window.location.href='Biletal.php'">Bilet Al </button>
                                    <?php
                                }
                                else
                                {
                                    ?>
                                    <button  class="blt" type="button" style="background-color: #ffff00" onclick="window.location.href='Biletal.php'" >Bilet Al </button>
                                    <?php
                                }
                            }
                        }
                    
                    ?>
                
            </div>
            <div class="col-7 col-sm-10 col-md-10">
                <div class="resim">
                        <table class="info" style="padding-top: 2px">
                            <tr>
                                <td width="150">>Yönetmen</td>
                                <td><?php echo $yntmn_adi. ' ' . $yntmn_soyadi ; ?></td>
                            </tr> 
                            <tr>
                                <td>>Yapım</td>
                                <td><?php echo $yil. ' Filmleri, ' . $yer; ?></td>
                            </tr>
                            <tr>
                                <td width="150">>Vizyon Tarihi</td>
                                <td><?php echo $vizyon; ?></td>
                            </tr> 
                            <tr>
                                <td>>Kategori</td>
                                <td><?php echo $kategori; ?></td>
                            </tr>
                            <tr>
                                <td>>Tür</td>
                                <td><?php echo $tur. ' Filmleri'; ?></td>
                            </tr>
                            <tr>
                                <td>>Oyuncular</td>
                                <td><?php
                                    $return12 = mysqli_query($conn, $bul);
                                            if(mysqli_num_rows($return12) > 0)
                                        {
                                          while($row12 = mysqli_fetch_assoc($return12))
                                          {
                                             echo $row12['oyuncu_adi']." ".$row12['oyuncu_soyadi']. ", ";
                                          }
                                        }
                                    ?>
                                </td>
                            </tr>
                        </table>
                </div>
                <div class="col-7 col-sm-12 col-md-12">
                <div class="ac"><?php echo $aciklama; ?></div>
            </div>
            </div>
        </div>
        </div>
        </div>
        
        <div>
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12 col-xl-6">
                    <div class="vi">
                        <iframe class="video" src="<?php echo $fragman; ?>"></iframe>
                    </div>
                </div>
                <div class="col-12 col-md-12 col-lg-12 col-xl-6">
                    <form action="" method="post" class="form-yorum"> 
                <div class="container" style="margin: 10px">
                <textarea id="yorum" class="form-control yorum" placeholder="Yorumunuzu yazın" rows="1" name="yorum"></textarea>
                <input type="submit" name="onay" value="Gönder" class="ybtn">
                </div>
                <div id="ktu" class="yrm-ktu">
                    <?php
                        $srg2= "SELECT uye_adi, uye_soyadi, yorum FROM uyeler,yorum,filmler WHERE uyeler.uye_ID=yorum.uye_ID AND yorum.film_ID=filmler.film_ID AND filmler.film_ID='".$filmid."' ORDER BY yorum_ID DESC";
                        $return=mysqli_query($conn,$srg2);

                        if(mysqli_num_rows($return) > 0)
                        {
                          while($gstr = mysqli_fetch_assoc($return))
                          {
                            echo "<div class='yorumlar'>
                                    <div>".$gstr['uye_adi']. ' ' .$gstr['uye_soyadi']."</div>
                                    <div>".$gstr['yorum']."</div>
                                    </div>";
                          }
                        }
                    
                    
                    ?>

                </div>
            </form>
                <?php

                if(@$_POST["onay"])
                {
                    $uyeyorum=$_SESSION["uyeid"];
                    $yorum=$_POST["yorum"];

                    if(empty($yorum))
                    {
                        $message = "Yorum yazınız!";
                        echo "<script type='text/javascript'>alert('$message');</script>" ;
                    }
                    else
                    {
                        $sorgu="INSERT INTO yorum (yorum,uye_ID,film_ID) VALUES ('$yorum','$uyeyorum','$filmid')";
                        $yrm2=mysqli_query($conn,$sorgu);
                            if(isset($uyeyorum) && $sorgu)
                            {
                                header("Refresh:0;");
                                $message2 = "Yorumunuz alındı.";
                                echo "<script type='text/javascript'>alert('$message2');</script>";
                            }
                            else
                            {
                                $message88 = "Yorum alma işlemi başarısız. Üyelik girişi yapınız.";
                                echo "<script type='text/javascript'>alert('$message88');</script>";
                            }
                    }
                }

                ?>
                </div>
            </div>
        </div>
        <?php } ?>
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