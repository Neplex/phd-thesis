$ENV{'TZ'}='Europe/Paris';

$pdf_mode = 1;
$make = "make -j4";

add_cus_dep('glo', 'gls', 0, 'makeglossary');

sub makeglossary{
  system( "makeindex -s \"$_[0].ist\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"" );
}

add_cus_dep('acn', 'acr', 0, 'makeacronym');

sub makeacronym{
  system( "makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"" );
}
