param(
  [Parameter()]
  [switch]$run
)

# Entry point of the application. Hardcoded by now
# DEFAULT: 'main'
$entry_point = 'main'

# .cpp source files
# DEFAULT: 'src/'
$source_path = 'src/'

# Third party libraries
# DEFAULT: 'libs/'
$libs_path = 'libs/'

# Test files
# DEFAULT: 'test/'
$test_path = 'test/'

# Public header files (.h or .hpp)
# DEFAULT: 'include/'
$include_path = 'include/'

# Output path of the application
# DEFAULT: 'bin/'
$bin_path = 'bin/'

Get-ChildItem -Path $source_path*.cpp |
foreach-object {
  $name = $_.BaseName
  g++ -c $source_path$name.cpp -o $bin_path/obj/$name.o -I $include_path
}

g++ $bin_path/obj/*.o -o $bin_path/main

if ($run) {
  ./bin/main
}