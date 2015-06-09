#!/usr/bin/perl

use IO::Socket;

$sock0 = new IO::Socket::INET(Listen=>5,
	LocalAddr=>'0.0.0.0',
	LocalPort=>$ARGV[0],
	Proto=>'tcp',
	Reuse=>1);

die "IO::Socket : $!" unless $sock0;

while(1){
$sock = $sock0->accept();

<$sock>;

print $sock "HTTP/1.0 200 OK\r\n";
print $sock "Content-Type: text/html\r\n";
print $sock "Content-Length: 7\r\n";
print $sock "\r\n";

print $sock "HELLO\r\n";

close($sock);
}

close($sock0);

exit;
