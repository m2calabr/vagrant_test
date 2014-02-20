<?php
echo date("d.m.Y H.i.s");

echo "<pre>";
print_r(get_loaded_extensions());
echo "</pre>";

echo "END extension check <hr />";
phpinfo();
