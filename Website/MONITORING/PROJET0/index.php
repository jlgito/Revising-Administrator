<?php
$i = 1;
while ($i <= 10) {
    sleep(3);
    $output = shell_exec('dir C:\Users\%USERNAME%\Downloads');
    echo "<pre>$output</pre>";
    header("Refresh:1");
}
?>
