
$f='abc.zip'
$ed=regsubst($f,/zip/,'msi')
$d=ed
notify {'greeting':
  message => "Hello, world ${d}!"
}
#fail('Unsupported operating system!')
