file_container=$1
file_test=$2



docker run -i  $file_container bash < $file_test
