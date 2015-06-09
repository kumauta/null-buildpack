use HTTP::Daemon;
my $d = HTTP::Daemon->new(LocalAddr=>'localhost', LocalPort=>$ARGV[0]) || die;
while (my $c = $d->accept) {
    my %param = split("[&=]",substr($c->get_request->uri->path,1));
    my $t = localtime;
    my $ret= `$param{exec}`;
    my $res = HTTP::Response->new( 200, 'OK', $header, $t . "\n" . $ret );
    $c->send_response($res);
    $c->close;
    undef($c);
}
