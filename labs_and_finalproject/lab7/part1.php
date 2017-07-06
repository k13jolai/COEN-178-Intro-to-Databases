<html>
  <?php
    $conn = oci_connect( 'jlai',
                         'ksbe.edu8', 
                         '//dbserver.engr.scu.edu/db11g' );
    if($conn) {
      print "connection successful<br />";
    } else {
      print "connection failed<br />";
      exit;
    }
    OCILogoff($conn);
  ?>
</html>
