<html>
  <?php
    $conn = oci_connect( 'jlai',
                         'ksbe.edu8', 
                         '//dbserver.engr.scu.edu/db11g' );
    if ($conn) {
        print "connection successful<br />";
    } else {
        print "connection failed<br />";
        exit;
    }
    echo "Getting customer information from Bank Database.<br />";

    echo "-- Creating SQL Statement<br />";
    // create SQL statement
    $sql = "SELECT *
            FROM accounts_6";

    echo "-- Parsing SQL Statement<br />";
    // parse SQL statement
    $sql_statement = OCIParse($conn, $sql);

    echo "-- Executing SQL Statement<br />";
    // execute SQL query
    OCIExecute($sql_statement);

    // get number of columns for use later
    $num_columns = OCINumCols($sql_statement);

    echo "-- Obtaining Results<br />";
    // start results formatting
    echo "<TABLE BORDER=1>";
    echo "<TR><TH>Account number</TH><TH>Account type</TH><TH>Amount</TH><TH>Customer number</TH>";
    // format results by row
    while (OCIFetch($sql_statement)) {
      echo "<TR>";
      for ($i = 1; $i <= $num_columns; $i++) {
        $column_value = OCIResult($sql_statement, $i);
        echo "<TD>$column_value</TD>";
      }
      echo "</TR>";
    }
    echo "</TABLE>";

    // free resources and close connection
    OCIFreeStatement($sql_statement);
    OCILogoff($conn);
  ?>
</html>