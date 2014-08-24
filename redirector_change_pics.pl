#!/usr/bin/perl
$|=1;
$count = 0;
$pid = $$;
while (<>) {
	chomp $_;
	if ($_ =~ /(.*\.jpg)/i) {
		$url = $1;
		system("/usr/bin/wget", "-q", "-O","/mydoc/test/images/$pid-$count.jpg", "$url");
		system("/usr/bin/mogrify", "-flip","/mydoc/test/images/$pid-$count.jpg");
		system("/usr/bin/convert", "/mydoc/test/images/$pid-$count.jpg", "/mydoc/test/logo.png", "-composite", "/mydoc/test/images/$pid-$count-1.jpg");
		system("/bin/chmod", "644", "/mydoc/test/images/$pid-$count-1.jpg");
		print "http://192.168.56.1/images/$pid-$count-1.jpg\n";
#		print "http://192.168.56.1/images/1.jpg\n";
	}
	elsif ($_ =~ /(.*\.gif)/i) {
		$url = $1;
		system("/usr/bin/wget", "-q", "-O","/mydoc/test/images/$pid-$count.gif", "$url");
		system("/usr/bin/mogrify", "-flip","/mydoc/test/images/$pid-$count.gif");
		system("/bin/chmod", "644", "/mydoc/test/images/$pid-$count.gif");
		print "http://192.168.56.1/images/$pid-$count.gif\n";
#		print "http://192.168.56.1/images/1.jpg\n";
	}
	elsif ($_ =~ /(.*\.png)/i) {
		$url = $1;
		system("/usr/bin/wget", "-q", "-O","/mydoc/test/images/$pid-$count.png", "$url");
		system("/usr/bin/mogrify", "-flip","/mydoc/test/images/$pid-$count.png");
		system("/bin/chmod", "644", "/mydoc/test/images/$pid-$count.png");
		print "http://192.168.56.1/images/$pid-$count.png\n";
#		print "http://192.168.56.1/images/1.jpg\n";
	}
	else {
		print "$_\n";;
	}
	$count++;
}
